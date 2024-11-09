extends Node2D

# Music and UI elements setup
@onready var music = $Music
@onready var label_combo = $ComboLabel
@onready var label_score = $ScoreLabel

# Area of timing acceptance setup
@onready var screen_width = get_viewport().size.x
@onready var screen_height = get_viewport().size.y

@onready var control_position = $Up.position.y
@onready var control_scale = $Up.scale.y
@onready var control_size = $Up.get_sprite_frames().get_frame_texture("default", 0).get_height()

@onready var middle_note_check = control_position
@onready var note_cut_by_eight = control_size * control_scale / 8

@onready var miss_threshold = middle_note_check - note_cut_by_eight * 8
@onready var ok_threshold = middle_note_check - note_cut_by_eight * 4
@onready var good_threshold = middle_note_check - note_cut_by_eight
@onready var perfect_threshold = middle_note_check + note_cut_by_eight
@onready var good_threshold2 = middle_note_check + note_cut_by_eight * 4
@onready var ok_threshold2 = middle_note_check + note_cut_by_eight * 8
@onready var miss_threshold2 = screen_height

# Variables setup
var rng = RandomNumberGenerator.new()
@export var seed = 12345

var start_time
var total_music_duration

var col = [MyQueue.new(), MyQueue.new(), MyQueue.new()]
var current_index = 0
var timing_values

# Preloading...
@onready var note_scene = preload("res://Scenes/Note.tscn")

func _ready():
	# Set the random seed, this way, each time player will see notes spawn at the exact same position (good for a music game)
	rng.seed = seed
	timing_values = MusicReader.read(Global.json_file_path)
	# If timing values are not properly loaded, quit the game
	if timing_values == null:
		get_tree().quit()

	var music_stream = load(Global.music_file_path)
	if music_stream:
		music.stream = music_stream
		total_music_duration = music_stream.get_length()
		music.play()
	else:
		print("Error loading music.")
		get_tree().quit()
	
	# Create visual lines for note thresholds (e.g., miss, perfect), use if you need to debug
	"""
	create_line(miss_threshold, Color(1,0 ,0))
	create_line(ok_threshold, Color(1,165./255.,0))
	create_line(good_threshold, Color(1,215./255.,0))
	create_line(perfect_threshold, Color(0,1,0))
	create_line(good_threshold2, Color(1,215./255.,0))
	create_line(ok_threshold2, Color(1,165./255.,0))
	"""
	
	start_time = Time.get_ticks_msec()


func _process(delta):
	# Spawn a new note at a random location at each timing of the song
	var elapsed_time = Time.get_ticks_msec() - start_time
	if current_index < timing_values.size() and elapsed_time >= timing_values[current_index]:
		current_index += 1
		spawn_note(rng.randi_range(0, 2))
	
	# Start the ending timer once all notes have been spawned
	if current_index == timing_values.size():
		$Timer.start()
		current_index += 1
		
	# Handle note destruction when a key is pressed
	if Input.is_action_just_pressed('left'):
		$Left.frame = 1
		$Left.get_child(0).start()
		if not col[0].is_empty():
			var note = col[0].dequeue()
			note.destroy(evaluate_score(note))
	if Input.is_action_just_pressed('up'):
		$Up.frame = 1
		$Up.get_child(0).start()
		if not col[1].is_empty():
			var note = col[1].dequeue()
			note.destroy(evaluate_score(note))
	if Input.is_action_just_pressed('right'):
		$Right.frame = 1
		$Right.get_child(0).start()
		if not col[2].is_empty():
			var note = col[2].dequeue()
			note.destroy(evaluate_score(note))
	
	# Destroy notes that fall off-screen (too late)
	for queue in col:
		if not queue.is_empty():
			var note = queue.peek()
			if note.position.y - note.get_child(1).get_shape().get_rect().size.y / 2 > 180:
				queue.dequeue()
				note.destroy(0)
				reset_combo()
				
	update_note_speed(elapsed_time / 1000.)


# Spawn a new note in a specific lane (0 = left, 1 = up, 2 = right)
func spawn_note(lane):
	var new_note = note_scene.instantiate()
	new_note.initialize(lane)
	col[lane].enqueue(new_note)
	add_child(new_note)


func update_note_speed(elapsed_time):	
	var time_factor = elapsed_time / total_music_duration

	# Lerp (linear interpolation) to limit speed between initial and max speed
	var new_speed = lerp(Global.initial_speed, Global.max_speed, time_factor)

	# Apply the new speed to all notes in all lanes
	for queue in col:
		for note in queue._to_string():
			note.speed = new_speed


func evaluate_score(note):
	# Evaluate the score based on the position of the note when hit
	if note.position.y < miss_threshold:
		reset_combo()
		return 0
	elif note.position.y < ok_threshold:
		update_score(1)
		return 1
	elif note.position.y < good_threshold:
		update_score(2)
		return 2
	elif note.position.y < perfect_threshold:
		update_score(3)
		return 3
	elif note.position.y < good_threshold2:
		update_score(2)
		return 2
	elif note.position.y < ok_threshold2:
		update_score(1)
		return 1
	else:
		reset_combo()
		return 0


func _input(event):
	if event.is_action("escape"):
		if get_tree().change_scene_to_file("res://Scenes/Menu.tscn") != OK:
			print("Error Changing Scene To Menu")


func reset_combo():
	Global.combo = 0
	label_combo.text = ""
	Global.hit[0] += 1


func update_score(rank):
	Global.combo += 1
	label_combo.text = str(Global.combo) + " combo!"
	if Global.combo > Global.max_combo:
		Global.max_combo = Global.combo
	Global.score += Global.combo * rank
	label_score.text = str(Global.score)
	Global.hit[rank] += 1


# Helper function to visualize lines for note thresholds
func create_line(threshold, color : Color):
	var line = Line2D.new()
	line.width = 1
	line.default_color = color
	line.add_point(Vector2(0, threshold))
	line.add_point(Vector2(screen_width, threshold))
	add_child(line)


func _on_timer_timeout():
	if get_tree().change_scene_to_file("res://Scenes/End.tscn") != OK:
		print("Error changing scene to End")

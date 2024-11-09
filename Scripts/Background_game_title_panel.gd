extends Panel

@export var title_min_scale = 0.75
@export var title_max_scale = 1.0
@export var title_move_range = 10

@onready var label = $GameTitleLabel

func _ready():
	pivot_offset = Vector2(size.x / 2, size.y / 2)


func _process(delta):
	rotation()
	scaling()


func rotation():
	# Sinusoidal rotation between -tile_move_range and title_move_range
	var angle = sin(Time.get_ticks_msec() / 1000.0) * title_move_range
	rotation_degrees = angle


func scaling():
	# Sinusoidal scaling between title_min_scale and title_max_scale
	var title_scale = ((sin(Time.get_ticks_msec() / 1000.0) + 1) / 2) * (title_max_scale - title_min_scale) + title_min_scale
	scale = Vector2(title_scale, title_scale)

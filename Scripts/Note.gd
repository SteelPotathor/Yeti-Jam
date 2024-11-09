extends Area2D

const LEFT_LANE_SPAWN = Vector2(120, -16)
const CENTER_LANE_SPAWN = Vector2(160, -16)
const RIGHT_LANE_SPAWN = Vector2(200, -16)

var speed = 1

@onready var label = $Label
@onready var timer = $Timer
@onready var texture = $CollisionShape2D

func _physics_process(delta):
	# Move the object downwards
	position.y += speed


func initialize(lane):
	if lane == 0:
		$AnimatedSprite2D.frame = 0
		position = LEFT_LANE_SPAWN
	elif lane == 1:
		$AnimatedSprite2D.frame = 1
		position = CENTER_LANE_SPAWN
	elif lane == 2:
		$AnimatedSprite2D.frame = 2
		position = RIGHT_LANE_SPAWN
	else:
		print("Invalid Lane Set for the Note: " + str(lane))
		return


# Handle the destruction sequence
func destroy(score):
	# Emit particles and hide the sprite to simulate a destruction effect
	$CPUParticles2D.emitting = true
	$AnimatedSprite2D.visible = false
	# Delay destruction
	timer.start()
	
	if score == 3:
		label.text = "PERFECT"
		label.modulate = Color("f6d6bd")
	elif score == 2:
		label.text = "GOOD"
		label.modulate = Color("c3a38a")
	elif score == 1:
		label.text = "OK"
		label.modulate = Color("997577")
	else:
		label.text = "MISS"
		label.modulate = Color("997577")


func _on_timer_timeout():
	queue_free()

extends Node2D

@onready var anim = $AnimatedSprite2D

# Track if an animation is currently playing (other than idle)
var is_anim_playing = false

func _ready() -> void:
	anim.flip_h = true
	anim.play("idle")


func _process(delta: float) -> void:
	# Only play a new animation if idle is currently playing
	if not is_anim_playing:
		if Input.is_action_just_pressed("left"):
			anim.play("anger")
			is_anim_playing = true
		if Input.is_action_just_pressed("up"):
			anim.play("anger")
			is_anim_playing = true
		if Input.is_action_just_pressed("right"):
			anim.play("anger")
			is_anim_playing = true


# Reset animation and play idle
func _on_animated_sprite_2d_animation_finished() -> void:
	is_anim_playing = false
	anim.play("idle")

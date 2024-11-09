extends AnimatedSprite2D

# Allows the button to blink
func _on_timer_timeout():
	frame = 0

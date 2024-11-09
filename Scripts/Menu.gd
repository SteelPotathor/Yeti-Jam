extends Node2D

@onready var bell_song = $VolumeTestButton/Bell

func _on_start_button_button_down():
	var result = get_tree().change_scene_to_file("res://Scenes/Difficulty.tscn")
	if result != OK:
		print("Error changing scene to game. Error code: %d" % result)
		get_tree().quit()


func _on_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))


func _on_volume_test_button_pressed():
	bell_song.play()

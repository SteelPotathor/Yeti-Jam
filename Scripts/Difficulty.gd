extends Node2D


func _on_easy_button_button_down():
	Global.json_file_path = "res://Songs/Music/Easy/sad.json"
	Global.music_file_path = "res://Songs/Music/Easy/sad.mp3"
	Global.initial_speed = .7
	Global.max_speed = 1.
	launch_game()


func _on_medium_button_button_down():
	Global.json_file_path = "res://Songs/Music/Medium/Knife.json"
	Global.music_file_path = "res://Songs/Music/Medium/Knife to the Throat.wav"
	Global.initial_speed = .7
	Global.max_speed = 1.5
	launch_game()


func _on_hard_button_button_down():
	Global.json_file_path = "res://Songs/Music/Hard/dandadan.json"
	Global.music_file_path = "res://Songs/Music/Hard/DAN DA DAN Opening Otonoke by Creepy Nuts.wav"
	Global.initial_speed = 1.
	Global.max_speed = 2.5
	launch_game()


func launch_game():
	var result = get_tree().change_scene_to_file("res://Scenes/Game.tscn")
	if result != OK:
		print("Error changing scene to game. Error code: %d" % result)
		get_tree().quit()

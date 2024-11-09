extends Node2D

func _ready():
	# Set the text of UI elements based on global variables
	$GradeNumber.text = Global.rank
	$ScoreNumber.text = str(Global.score)
	$ComboNumber.text = str(Global.max_combo)
	$PerfectNumber.text = str(Global.hit[3])
	$GoodNumber.text = str(Global.hit[2])
	$OkayNumber.text = str(Global.hit[1])
	$MissedNumber.text = str(Global.hit[0])
	$GradeNumber.text = Global.eval_rank()


func _on_play_again_pressed():
	if get_tree().change_scene_to_file("res://Scenes/Game.tscn") != OK:
		print("Error Changing scene to Game")


func _on_back_to_menu_pressed():
	if get_tree().change_scene_to_file("res://Scenes/Menu.tscn") != OK:
		print("Error changing scene to Menu")

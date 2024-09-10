extends Control

func _ready():
	$EasyButton.connect("pressed", _on_easy_button_pressed)
	$NormalButton.connect("pressed", _on_normal_button_pressed)
	$HardButton.connect("pressed", _on_hard_button_pressed)

func _on_easy_button_pressed():
	Global.computer_speed = 485
	Global.ball_speed = 500
	set_player_name_and_start()
	
func _on_normal_button_pressed():
	Global.computer_speed = 500
	Global.ball_speed = 510
	set_player_name_and_start()
	
func _on_hard_button_pressed():
	Global.computer_speed = 525
	Global.ball_speed = 530
	set_player_name_and_start()

func set_player_name_and_start():
	Global.player_name = $LineEdit.text.to_upper()
	if Global.player_name.strip_edges() == "":
		Global.player_name = "Player"
	get_tree().change_scene_to_file("res://Pong/pong.tscn")
	
func _on_exit_button_pressed() -> void:
	Global._on_exit_button_pressed()

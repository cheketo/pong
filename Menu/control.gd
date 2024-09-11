extends Control

func _ready():
	$EasyButton.connect("pressed", _on_easy_button_pressed)
	$NormalButton.connect("pressed", _on_normal_button_pressed)
	$HardButton.connect("pressed", _on_hard_button_pressed)

func _on_easy_button_pressed():
	Global.computer_speed = 470
	Global.ball_speed = 500
	get_parent().set_player_name_and_start()
	
func _on_normal_button_pressed():
	Global.computer_speed = 490
	Global.ball_speed = 510
	get_parent().set_player_name_and_start()
	
func _on_hard_button_pressed():
	Global.computer_speed = 535
	Global.ball_speed = 550
	get_parent().set_player_name_and_start()
	
func _on_exit_button_pressed() -> void:
	get_parent().exit()

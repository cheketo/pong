extends Node

var player_name = ""
var computer_speed = 475
var ball_speed = 500
var movement_enabled = false

func _on_exit_button_pressed():
	get_tree().quit()

func stop_movement():
	movement_enabled = false

func start_movement():
	movement_enabled = true

extends Node2D

const CENTER = Vector2(640,360)
var playerScore = 0
var computerScore = 0
var player_name = "PLAYER"

func _ready() -> void:
	$Field.get_node("Player").text = Global.player_name.to_upper()
	$PressSpaceBarLabel.start_blink()

func _on_goal_left(_body: Node2D) -> void:
	computerScore += 1
	reset_positions()

func _on_goal_right(_body: Node2D) -> void:
	playerScore += 1
	reset_positions()

func reset_positions() -> void:
	$Player.position = $Player.INITAL_POSITION
	$Computer.position = $Computer.INITAL_POSITION
	$Field.get_node("LeftScore").text = str(playerScore)
	$Field.get_node("RightScore").text = str(computerScore)
	$Ball.position = CENTER
	$Ball.reset()

func _on_exit_button_pressed() -> void:
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Menu/menu.tscn")

func _on_ball_ball_is_moving(is_moving: Variant) -> void:
	if is_moving:
		$PressSpaceBarLabel.stop_blink()
	else:
		$PressSpaceBarLabel.start_blink()

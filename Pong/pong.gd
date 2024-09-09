extends Node2D

const CENTER = Vector2(640,360)
var playerScore = 0
var computerScore = 0
var player_name = "PLAYER"

func _ready() -> void:
	$Field.get_node("Player").text = Global.player_name.to_upper()
	

func _on_goal_left(body: Node2D) -> void:
	computerScore += 1
	reset_positions()
	
func _on_goal_right(body: Node2D) -> void:
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
	Global._on_exit_button_pressed()

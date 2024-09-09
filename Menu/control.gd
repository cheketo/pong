extends Control

func _ready():
	$PlayButton.connect("pressed", _on_start_button_pressed)

func _on_start_button_pressed():
	Global.player_name = $LineEdit.text.to_upper()
	if Global.player_name.strip_edges() == "":
		Global.player_name = "Player"
	get_tree().change_scene_to_file("res://Pong/pong.tscn")


func _on_exit_button_pressed() -> void:
	Global._on_exit_button_pressed()

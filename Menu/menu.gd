extends Node2D

@onready var audio_player = $AudioStreamPlayer
@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	# Reproducir fade in al entrar a la escena
	audio_player.play()
	animation_player.play("fade_in")

func set_player_name_and_start():
	Global.player_name = $Control.get_node("LineEdit").text.to_upper()
	if Global.player_name.strip_edges() == "":
		Global.player_name = "Player"
	#animation_player.play("fade_out") #TO DO
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Pong/pong.tscn")

func exit():
	await get_tree().create_timer(0.1).timeout
	Global._on_exit_button_pressed()

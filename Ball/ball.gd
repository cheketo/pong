extends CharacterBody2D

signal ball_is_moving(is_moving)

var movement_enabled = false

func _ready() -> void:
	reset()

func rand_direction():
	if randi() % 2 == 0:
		return 1
	else:
		return -1

func reset():
	velocity = Vector2.ZERO
	movement_enabled = false
	emit_signal("ball_is_moving", movement_enabled)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_select"):
		start_movement()

func start_movement() -> void:
	if not movement_enabled:
		velocity.x = rand_direction()
		velocity.y = rand_direction()
		velocity *= Global.ball_speed
		movement_enabled = true
		emit_signal("ball_is_moving", movement_enabled)

func _physics_process(delta: float) -> void:
	if movement_enabled:
		var collision_info = move_and_collide(velocity * delta)
		if collision_info:
			velocity = velocity.bounce(collision_info.get_normal())
			var body = collision_info.get_collider()
			var audio_player = body.get_node("AudioStreamPlayer2D")
			if audio_player:
				audio_player.play()

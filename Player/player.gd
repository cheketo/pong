extends CharacterBody2D

var speed = 500
const INITAL_POSITION = Vector2(100,360)

func _ready() -> void:
	print("Player Ready")

func _physics_process(delta: float) -> void:
	velocity.y = 0
	if( Input.is_action_pressed("ui_down")):
		velocity.y = 1
	if( Input.is_action_pressed("ui_up")):
		velocity.y = -1
	velocity.y *= speed
	move_and_collide(velocity * delta)

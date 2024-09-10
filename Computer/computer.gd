extends CharacterBody2D

var ball
const INITAL_POSITION = Vector2(1180,360)

func _ready() -> void:
	ball = get_parent().get_node("Ball")
	
func _physics_process(delta: float) -> void:
	if abs(ball.position.y - position.y) < 20:
		return
	if ball.position.y < position.y:
		velocity.y = -1
	else:
		velocity.y = 1
	
	velocity *= Global.computer_speed
	move_and_collide(velocity * delta)

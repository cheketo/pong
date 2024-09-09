extends CharacterBody2D

var speed = 500

func _ready() -> void:
	reset()
	
func rand_direction():
	if randi() % 2 == 0:
		return 1
	else:
		return -1

func reset():
	velocity.x = rand_direction()
	velocity.y = rand_direction()
	velocity *= speed

func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())

extends Node2D

signal goal_right(body)
signal goal_left(body)

func _on_goal_right_body_entered(body: Node2D) -> void:
	emit_signal("goal_right", body)
	
func _on_goal_left_body_entered(body: Node2D) -> void:
	emit_signal("goal_left", body)

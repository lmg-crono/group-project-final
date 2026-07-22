extends RigidBody2D
@export var push_force = 600
func _on_body_entered(body: Node) -> void:
	if body.name == "CharacterBody2D":
		var push_direction = Vector2.RIGHT
		if global_position.x < body.global.position.x:
			push_direction = Vector2.LEFT
		apply_force(push_force * push_direction)

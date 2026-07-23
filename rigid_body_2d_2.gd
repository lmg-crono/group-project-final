extends RigidBody2D
@export var push_force = 50
var pushed = false
func _on_body_entered(body: Node) -> void:
	if pushed: return
	if body.name == "CharacterBody2D":
		var push_direction = Vector2.RIGHT
		if global_position.x < body.global.position.x:
			push_direction = Vector2.LEFT
		apply_impulse(push_force * push_direction)
		pushed = true
		
		
		
func _physics_process(delta: float) -> void:
	print(linear_velocity)

extends CharacterBody2D

@export var speed : int = 2
@onready var ray_cast_2d: RayCast2D = $RayCast2D
func _physics_process(delta: float) -> void:
	position.x += speed
	if ray_cast_2d.is_colliding():
		ray_cast_2d.target_position.x *= -1
		speed *= -1
	move_and_slide()

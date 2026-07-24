extends StaticBody2D
#walk into secret area door to destroy it, eventually replace for kick.
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("kick") :
		queue_free()

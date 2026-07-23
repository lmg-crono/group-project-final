extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		Global.lives -= 1
		get_tree().reload_current_scene()

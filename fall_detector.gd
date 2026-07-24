extends Area2D






func _on_body_entered(body: Node2D) -> void:
	Global.lives -=1
	Global.Life_lost.emit()
	get_tree().reload_current_scene.call_deferred()


@export var push_force = 600

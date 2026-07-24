extends Area2D
var reloaded = false
func _on_body_entered(body: Node2D) -> void:
	if reloaded: 
		return
	if body.name == "CharacterBody2D":
		Global.lives -= 1
		Global.life_lost.emit()
		reloaded = true
		#get_tree().reload_current_scene.call_deferred()
		

extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		#add one collectable
		Global.collectables += collectible_amount
		#Update the other nodes
		Global.update_collectables.emit()
		queue_free()
@export var collectible_amount : int = 1



	

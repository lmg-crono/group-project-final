extends Button

func _on_pressed() -> void:
	if Global.lives <= 0:
		Global.lives = 5
		get_tree().change_scene_to_file("res://node_2d.tscn")

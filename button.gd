extends Button



func _on_button_down() -> void:
	if Global.lives <= 0:
		get_tree().change_scene_to_file("res://node_2d.tscn")

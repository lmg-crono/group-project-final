extends Button

func _on_button_down() -> void:
		Global.lives = 5
		get_tree().change_scene_to_file("res://node_2d.tscn")

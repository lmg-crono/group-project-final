extends Node2D

func _ready() -> void:
	Global.life_lost.connect(_on_life_lost)
func _on_life_lost():
	if Global.lives > 0:
		get_tree().reload_current_scene()
	else:
		get_tree().change_scene_to_file("res://credits.tscn")

extends Label
	
func _ready():
	text = "Candy: "+ str(Global.collectables)
	Global.update_collectables.connect(_on_update_collectables)
func _on_update_collectables():
	text = "Candy: "+ str(Global.collectables)
func _process(delta: float) -> void:
	pass

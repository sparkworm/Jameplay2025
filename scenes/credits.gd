class_name Credits
extends GameScene

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		MessageBus.change_scene.emit(Scenes.ID.MAIN_MENU)

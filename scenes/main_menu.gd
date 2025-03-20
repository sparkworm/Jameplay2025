class_name MainMenu
extends GameScene

@onready var play_button: Button = %PlayButton
@onready var credits_button: Button = %CreditsButton

func _ready() -> void:
	play_button.pressed.connect(Callable(self, "play"))
	credits_button.pressed.connect(Callable(self, "credits"))

func play() -> void:
	MessageBus.change_scene.emit(Scenes.ID.L1)

func credits() -> void:
	MessageBus.change_scene.emit(Scenes.ID.END)

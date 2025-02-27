## Main scene of the game.  The very highest node in the tree.
class_name Main
extends Node

## The first scene the player will see when the game is launched.
@export var starting_scene: Scenes.ID

## The current active game scene.
var active_scene: GameScene

## Holder of the active scene.
## NOTE: Should only every contain one scene
@onready var active_scene_parent: Node = $ActiveSceneParent

func _ready() -> void:
	# connect signals
	MessageBus.change_scene.connect(Callable(self, "load_scene"))
	MessageBus.game_quit.connect(Callable(self, "quit_game"))

	if starting_scene != null:
		load_scene(starting_scene)

func load_scene(scene_name: Scenes.ID) -> void:
	# Remove active scene.  There shouldn't be more than one, but for-loop
	# is there for flexibility
	# NOTE: may want to move this to seperate function if such an abrupt stop
	# isn't ideal
	if not Scenes.scenes.has(scene_name):
		print("ERROR: scene ", scene_name, " does not exist.")
		return

	for child: Node in active_scene_parent.get_children():
		active_scene_parent.call_deferred("remove_child", child)
	# add scene
	var new_scene: GameScene = Scenes.scenes[scene_name].instantiate()
	active_scene_parent.add_child(new_scene)
	# set active_scene to be a reference to this new active scene
	active_scene = new_scene

## Function for quitting the game.  May eventually have functionality such as
## saving progress
func quit_game() -> void:
	get_tree().quit()

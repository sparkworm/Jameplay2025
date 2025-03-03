## A playable level, more specific than a GameScene which can be something like the main menu
class_name Level
extends GameScene

@export var barrier: PackedScene

@onready var player_barriers: Node = $PlayerBarriers

var last_barrier: PlayerBarrier

func _process(delta:float) -> void:
	if Input.is_action_just_pressed("place_barrier"):
		place_barrier(get_local_mouse_position())
	elif Input.is_action_pressed("place_barrier"):
		update_barrier_angle()
	if Input.is_action_just_released("place_barrier"):
		last_barrier.enable()
		last_barrier = null

func place_barrier(coords:Vector2) -> void:
	var new_bar = barrier.instantiate() as PlayerBarrier
	new_bar.position = coords
	player_barriers.add_child(new_bar)
	new_bar.disable()
	last_barrier = new_bar

func update_barrier_angle() -> void:
	if last_barrier:
		print("updating angle")
		last_barrier.look_at(get_local_mouse_position())

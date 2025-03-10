## A playable level, more specific than a GameScene which can be something like the main menu
class_name Level
extends GameScene

@export var barrier: PackedScene

@onready var player_barriers: Node = $PlayerBarriers
@onready var barrier_detector: RayCast2D = $BarrierDetector

var last_barrier: PlayerBarrier

func _process(delta:float) -> void:
	if Input.is_action_just_pressed("place_barrier"):
		place_barrier(get_local_mouse_position())
	elif Input.is_action_pressed("place_barrier"):
		update_barrier_angle()
	if Input.is_action_just_released("place_barrier"):
		last_barrier.enable()
		last_barrier = null
	if Input.is_action_just_pressed("destroy_barrier"):
		destroy_barrier()

func place_barrier(coords:Vector2) -> void:
	var new_bar = barrier.instantiate() as PlayerBarrier
	new_bar.position = coords
	player_barriers.add_child(new_bar)
	new_bar.disable()
	last_barrier = new_bar

func destroy_barrier() -> void:
	barrier_detector.position = get_local_mouse_position()
	barrier_detector.target_position = Vector2(0,0)
	barrier_detector.force_raycast_update()
	var barrier_col = barrier_detector.get_collider()
	print(barrier_col)
	barrier_col = barrier_col as PlayerBarrier
	if barrier_col:
		barrier_col.queue_free()

func update_barrier_angle() -> void:
	if last_barrier:
		last_barrier.look_at(get_local_mouse_position())

## A playable level, more specific than a GameScene which can be something like the main menu
class_name Level
extends GameScene

@export var barrier: PackedScene
@export var scale_factor: float = 50.0
@export var obstacle_penalty: float = 50

@onready var player_barriers: Node = $PlayerBarriers
@onready var barrier_detector: RayCast2D = $BarrierDetector
@onready var score_label: Label = %ScoreLabel
@onready var ball: Ball = $Ball
@onready var tiles: Tiles = $Tiles

var last_barrier: PlayerBarrier
var score: float = 0.0

func _ready() -> void:
	ball.obstacle_hit.connect(Callable(self, "hit_obstacle"))
	tiles.tiles_cleared.connect(Callable(self, "level_end"))

func level_end() -> void:
	MessageBus.change_scene.emit(Scenes.level_after(scene_name))

func _process(delta:float) -> void:
	if Input.is_action_just_pressed("place_barrier"):
		place_barrier(get_local_mouse_position())
	elif Input.is_action_pressed("place_barrier"):
		update_barrier_angle()
		update_barrier_scale()
	if Input.is_action_just_released("place_barrier") and last_barrier:
		last_barrier.enable()
		last_barrier = null
	if Input.is_action_just_pressed("destroy_barrier"):
		destroy_barrier()
	# update scores
	update_score(delta)

func update_score(delta: float) -> void:
	score += (player_barriers.get_child_count() + 1) * delta
	score_label.text = str("Score: ", floor(score))

func hit_obstacle() -> void:
	score += obstacle_penalty

func place_barrier(coords:Vector2) -> void:
	var new_bar = barrier.instantiate() as PlayerBarrier
	new_bar.position = coords
	player_barriers.add_child(new_bar)
	new_bar.disable()
	last_barrier = new_bar
	update_barrier_scale()

func destroy_barrier() -> void:
	barrier_detector.position = get_local_mouse_position()
	barrier_detector.target_position = Vector2(0,0)
	barrier_detector.force_raycast_update()
	var barrier_col = barrier_detector.get_collider()
	barrier_col = barrier_col as PlayerBarrier
	if barrier_col:
		barrier_col.queue_free()

func update_barrier_angle() -> void:
	if last_barrier:
		last_barrier.look_at(get_local_mouse_position())

func update_barrier_scale() -> void:
	var distance = last_barrier.position.distance_to(get_local_mouse_position())
	distance /= scale_factor
	last_barrier.scale = Vector2(distance,distance)

class_name Ball
extends CharacterBody2D

signal ball_collided(col: KinematicCollision2D)

@export var speed: float = 5

func _ready() -> void:
	velocity = speed * Vector2(0,-1)

func _physics_process(_delta: float) -> void:
	var collision := move_and_collide(velocity)
	if collision:
		bounce(collision)
		hit_tile(collision)

## Changes direction after collision
func bounce(col: KinematicCollision2D) -> void:
	velocity = velocity.bounce(col.get_normal())

func hit_tile(col: KinematicCollision2D) -> void:
	if col.get_collider() is Tiles:
		var tilemap = col.get_collider() as Tiles
		var coords: Vector2i = tilemap.get_coords_for_body_rid(col.get_collider_rid())
		tilemap.demote_tile(coords)

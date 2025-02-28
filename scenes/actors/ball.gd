class_name Ball
extends CharacterBody2D

@export var speed: float = 5

func _ready() -> void:
	velocity = speed * Vector2(0,-1)

func _physics_process(_delta: float) -> void:
	var collision := move_and_collide(velocity)
	if collision:
		bounce(collision)

## Changes direction after collision
func bounce(col: KinematicCollision2D) -> void:
	velocity = velocity.bounce(col.get_normal())

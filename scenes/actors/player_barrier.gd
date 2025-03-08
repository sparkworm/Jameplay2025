class_name PlayerBarrier
extends CharacterBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var pixel: Sprite2D = $Pixel


func disable() -> void:
	collision_shape_2d.disabled = true
	pixel.modulate = Color(1,1,0.5)
	pixel.material.set_shader_parameter("enabled", false)

func enable() -> void:
	collision_shape_2d.disabled = false
	pixel.modulate = Color(1,1,1)
	pixel.material.set_shader_parameter("enabled", true)

class_name State
extends Node

@export var animation: String
@export var move_speed: int = 400

var body: CharacterBody2D
var animated_sprite: AnimatedSprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var shared_data: Dictionary = {}

func init() -> void:
	if animated_sprite: animated_sprite.play(animation)
	
func exit() -> void:
	pass
func process_frame(delta: float) -> State:
	return null
func process_physics(delta: float) -> State:
	return null
func unhandled_input(input: InputEvent) -> State:
	return null

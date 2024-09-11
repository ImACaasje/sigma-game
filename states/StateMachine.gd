class_name StateMachine
extends Node

@export var start_state: State

@onready var current_state: State

func change_state(state: State):
	if current_state:
		current_state.exit()
	
	current_state = state
	current_state.init()

func init(parent: CharacterBody2D, speed: int, animated_sprite: AnimatedSprite2D = null) -> void:
	for child in get_children():
		child.body = parent
		child.animated_sprite = animated_sprite
		child.move_speed = speed
	change_state(start_state)
		
func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)
		
func unhandled_input(event: InputEvent) -> void:
	var new_state = current_state.unhandled_input(event)
	if new_state:
		change_state(new_state)

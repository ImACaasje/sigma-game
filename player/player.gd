extends CharacterBody2D

@export var state_machine: StateMachine
@export var move_speed: int = 400

func _ready() -> void:
	state_machine.init(self,move_speed, $AnimatedSprite2D)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
func _unhandled_input(event: InputEvent) -> void:
	state_machine.unhandled_input(event)

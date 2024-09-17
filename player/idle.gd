extends State

@export var idle: State
@export var crouch_move: State
@export var jump: State
@export var fall: State

func init() -> void:
	super()


func unhandled_input(event: InputEvent) -> State:
	if Input.get_axis("left", "right") != 0:
		return crouch_move
	if Input.is_action_just_pressed("jump"):
		return jump
		
	return null

func process_physics(delta: float) -> State:
	body.velocity.y += gravity * delta
	body.move_and_slide()
	
	if !Input.is_action_pressed("crouch"):
		return idle
	if !body.is_on_floor():
		return fall
		
	return null
		

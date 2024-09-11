extends State

@export var move: State
@export var jump: State

func init() -> void:
	super()

func unhandled_input(event: InputEvent) -> State:
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		return move
	if Input.is_action_just_pressed("jump"):
		return jump
		
	return null

func process_physics(delta: float) -> State:
	body.velocity.y += gravity * delta
	body.move_and_slide()
	
	
	return null

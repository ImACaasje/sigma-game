extends State

@export var idle: State
@export var crouch_move: State

func init() -> void:
	super()
	print("initianted")


func unhandled_input(event: InputEvent) -> State:
	if Input.get_axis("left", "right") != 0:
		return crouch_move
		
	return null

func process_physics(delta: float) -> State:
	body.velocity.y += gravity * delta
	#print("wsg")
	body.move_and_slide()
	
	if !Input.is_action_pressed("crouch"):
		return idle
		
	return null
		

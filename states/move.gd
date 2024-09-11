extends State

@export var idle: State
@export var jump: State
@export var fall: State

func init() -> void:
	super()

func unhandled_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		return jump
		
	return null

func process_physics(delta: float) -> State:
	var dir: int = Input.get_axis("left", "right")
	
	if dir: animated_sprite.flip_h = dir < 0
	
	body.velocity.x = dir * move_speed
	body.move_and_slide()
	
	if dir == 0:
		return idle
	if !body.is_on_floor():
		return fall
	
	return null

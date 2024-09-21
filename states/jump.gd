extends State

@export var fall: State
@export var idle: State
@export var jump_height: int = 100

func init() -> void:
	super()
	body.velocity.y = -jump_height

func process_physics(delta: float) -> State:
	body.velocity.y += gravity * delta
	
	var dir: int = Input.get_axis("left", "right")
	
	body.velocity.x = dir * move_speed
	if dir: animated_sprite.flip_h = dir < 0
	
	body.move_and_slide()
	
	if body.velocity.y > 0:
		return fall
	if body.is_on_floor():
		return idle
		
	return null

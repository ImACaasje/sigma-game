extends State

@export var idle: State
@export var move: State

func init() -> void:
	super()
	
func process_physics(delta: float) -> State:
	body.velocity.y += gravity * delta
	
	var dir: int = Input.get_axis("left", "right")
	
	body.velocity.x = dir * move_speed
	if dir: animated_sprite.flip_h = dir < 0
	body.move_and_slide()
	
	if body.is_on_floor() and dir:
		return move
	elif body.is_on_floor():
		return idle
		
	return null

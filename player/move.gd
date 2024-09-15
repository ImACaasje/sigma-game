extends State

@export var move: State
@export var crouch_idle: State

func init() -> void:
	super()
	
func process_physics(delta: float) -> State:
	body.velocity.y += gravity * delta
	
	var dir = Input.get_axis("left", "right")
	
	if dir: animated_sprite.flip_h = dir < 0
	body.velocity.x = dir * move_speed
	body.move_and_slide()
	
	if !Input.is_action_pressed("crouch"):
		return move
	if dir == 0:
		return crouch_idle
	
	return null

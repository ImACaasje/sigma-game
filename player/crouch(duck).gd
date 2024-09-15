extends State

@export var crouch_move: State
@export var crouch_idle: State
var current_state: State

func init() -> void:
	current_state = crouch_move if Input.get_axis("left", "right") != 0 else crouch_idle
	current_state.init()
	for child in get_children():
		child.body = body
	#print(current_state)
	

func change_state(new_state: State) -> State:
	if new_state == crouch_move or crouch_idle:
		print(new_state)
		current_state.exit()
		current_state = new_state
		current_state.init()
		return null
	else:
		return new_state

func process_physics(delta: float) -> State:
	var new_state = current_state.process_physics(delta)
	if new_state:
		return change_state(new_state)
		
	return null

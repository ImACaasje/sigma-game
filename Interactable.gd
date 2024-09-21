extends Area2D

@export var interaction_action_needed: bool = false
@export var one_shot: bool = false
@export var key_press_needed: Key = KEY_E

var in_area: bool = false
var paused: bool = false

signal on_entered(area)
signal on_left(area)
signal interaction

func _ready() -> void:
	$Text.visible = false
	$Text.text = "Press " + OS.get_keycode_string(key_press_needed).to_upper()

func _on_area_entered(area):
	if !paused:
		on_entered.emit(area)
		in_area = true
		if interaction_action_needed: $Text.visible = true

func _on_area_exited(area):
	if !paused:
		on_left.emit(area)
		in_area = false
		if interaction_action_needed: $Text.visible = false
		if one_shot and !interaction_action_needed: queue_free()
	
func _unhandled_input(event: InputEvent) -> void:
	if !paused:
		if in_area and interaction_action_needed:
			if Input.is_key_pressed(key_press_needed):
				interaction.emit()
				if one_shot: queue_free()

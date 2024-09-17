extends Node

@export var char_name: String = "Name;"
@export var text: Array[String] = ["Line1", "Line2", "Etc."]
@export var time_between_characters: float = 0.025
@export var skip_timer_time: float = 0.25
@export var name_color: Color = Color.WHITE

@onready var bottom_right_arrows: Label = $arrows
@onready var skip_timer: Timer = $skip_timer

signal quit_dialogue

var current_character_index: int = 0
var current_text: String = ""
var current_line: int = 0
var wait_for_input: bool = false
var is_in_click_area: bool = false

func _ready() -> void:
	$Timer.wait_time = time_between_characters
	$name.text = char_name
	clear_text()
	$name.label_settings.font_color = name_color
	bottom_right_arrows.visible = false
	skip_timer.wait_time = skip_timer_time
	
	
func start_dialogue() -> void: 
	$name.visible = true
	$text.visible = true
	$Sprite2D.visible = true
	$Timer.start()
	
func set_text() -> void:
	$text.text = current_text
func clear_text() -> void:
	$text.text = ""
func next_line() -> void:
	current_line += 1
	current_text = ""
	current_character_index = 0
	wait_for_input = false
	clear_text()
	
func next_character() -> void:
	if current_character_index < text[current_line].length():
		current_text = current_text + text[current_line][current_character_index]
		current_character_index += 1
		set_text()
		$Timer.start()
	else:
		bottom_right_arrows.visible = true
		wait_for_input = true

func _unhandled_input(event: InputEvent) -> void:
	if wait_for_input and Input.is_action_just_pressed("click") and is_in_click_area:
		if current_line < text.size() - 1:
			bottom_right_arrows.visible = false
			next_line()
		else:
			queue_free()
			quit_dialogue.emit()
			
	elif Input.is_action_just_pressed("click") and is_in_click_area:
		if skip_timer.time_left == 0:
			skip_timer.start()
		elif skip_timer.time_left != 0:
			current_character_index = text[current_line].length()
			current_text = text[current_line]
			set_text()

func _on_timer_timeout() -> void:
	next_character()

func _on_click_area_mouse_entered():
	is_in_click_area = true

func _on_click_area_mouse_exited():
	is_in_click_area = false

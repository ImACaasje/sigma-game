extends Area2D




func _on_interactable_interaction():
	$AnimatedSprite2D.flip_h = $Interactable.get_overlapping_areas()[0].global_position.x < global_position.x
	$Dialogue.start_dialogue()
	$Interactable.paused = true


#func _on_interactable_on_entered():
	#$AnimatedSprite2D.flip_h = $Interactable.get_overlapping_areas()[0].global_position.x < global_position.x
	#$Dialogue.start_dialogue()
	#$Interactable.paused = true

func _on_dialogue_on_dialogue_end():
	$Interactable.paused = false

extends Area2D




func _on_interactable_interaction():
	$Dialogue.start_dialogue()
	$Interactable.paused = true


#func _on_interactable_on_entered():
	#$Dialogue.start_dialogue()


func _on_dialogue_on_dialogue_end():
	$Interactable.paused = false

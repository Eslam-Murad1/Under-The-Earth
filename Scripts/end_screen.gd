extends Control


func _on_button_pressed() -> void:
	$Button/AudioStreamPlayer.play()
	await $Button/AudioStreamPlayer.finished
	get_tree().quit()
	pass # Replace with function body.

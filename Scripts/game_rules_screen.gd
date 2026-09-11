extends Control


func _on_button_pressed() -> void:
	$Button/AudioStreamPlayer.play()
	await $Button/AudioStreamPlayer.finished
	get_tree().change_scene_to_file("res://Scenes/level_1.tscn")
	pass # Replace with function body.

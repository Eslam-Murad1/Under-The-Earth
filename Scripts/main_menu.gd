extends Control


func _on_start_pressed() -> void:
	GameManger.health = GameManger.MAX_HEALTH
	$Button/AudioStreamPlayer.play()
	await $Button/AudioStreamPlayer.finished
	get_tree().change_scene_to_file("res://GameRules_Screen.tscn")
	pass # Replace with function body.


func _on_exit_pressed() -> void:
	$Button2/AudioStreamPlayer.play()
	await $Button2/AudioStreamPlayer.finished
	get_tree().quit()
	pass # Replace with function body.

extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.score = Global.score + 1
		$AudioStreamPlayer.play() 
		$AudioStreamPlayer.finished.connect(queue_free)
		
	pass 

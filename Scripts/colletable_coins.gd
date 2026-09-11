extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		GameManger.add_point()
		$AudioStreamPlayer2D.play()
		hide()
		$CollisionShape2D.set_deferred("disabled", true) # تمنع تكرار التجميع
		$AudioStreamPlayer2D.finished.connect(queue_free)

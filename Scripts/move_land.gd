extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		animation_player.play("move_land")
	pass # Replace with function body.

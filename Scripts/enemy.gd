extends CharacterBody2D

var speed = 120
var gravity = 14
var dir = -1

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity

	if is_on_wall() or not $RayCast2D.is_colliding():
		dir *= -1
		$AnimatedSprite2D.flip_h = dir < 1
	velocity.x = speed * dir
	
	move_and_slide()	
	
func _ready() -> void:
	$AnimatedSprite2D.play("move")
	$AnimatedSprite2D.flip_h = dir < 0
	pass
	


func _on_body_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.Damege()
	pass # Replace with function body.


func _on_head_body_entered(body: Node2D) -> void:	
	if body.is_in_group("player"):
		queue_free()
	pass # Replace with function body.

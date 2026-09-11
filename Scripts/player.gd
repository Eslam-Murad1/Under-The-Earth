extends CharacterBody2D

var speed = 250
var jump = 350
var gv = 10
var moving = false

var jump_count = 0


func _physics_process(_delta: float) -> void:
	velocity.x = 0
	moving = false

	if Input.is_action_pressed("Right"):
		$AnimatedSprite2D.scale.x = 1
		moving = true
		velocity.x = speed

	if Input.is_action_pressed("Left"):
		$AnimatedSprite2D.scale.x = -1
		moving = true
		velocity.x = -speed

	# القفز - يسمح بثلاث قفزات فقط
	if Input.is_action_just_pressed("Jump") and jump_count < 3:
		velocity.y = -jump
		jump_count += 1
		$AudioStreamPlayer2D.play()
	else:
		velocity.y += gv

	animations()
	move_and_slide()

	# إعادة عدد القفزات عند لمس الأرض
	if is_on_floor():
		jump_count = 0


func animations() -> void:
	if is_on_floor():
		if moving:
			$AnimatedSprite2D.play("move")
		else:
			$AnimatedSprite2D.play("idel")
	else:
		$AnimatedSprite2D.play("jump")


func Damege() -> void:
	GameManger.take_damage(1)

	velocity.y = -200

	if GameManger.health == 0:
		$AudioStreamPlayer2D2.play()
		await $AudioStreamPlayer2D2.finished
		GameManger.reset_game()
		get_tree().change_scene_to_file("res://Main_Menu.tscn")


func _on_danguros_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Damege()

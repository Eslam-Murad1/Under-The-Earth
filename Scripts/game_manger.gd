extends Node

signal coins_changed(points)
signal health_changed(new_health)

var points: int = 0
var health: int = 4
const MAX_HEALTH: int = 4

func add_point() -> void:
	points += 1
	coins_changed.emit(points)

func take_damage(amount: int = 1) -> void:
	health = max(health - amount, 0)
	health_changed.emit(health)

func reset_game() -> void:
	health = MAX_HEALTH
	points = 0
	coins_changed.emit(points)
	health_changed.emit(health)

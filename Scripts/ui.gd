extends CanvasLayer

@onready var coins_label = $Panel/CoinsPoint
@onready var sprite_health: Sprite2D = $Health/Sprite_Health

func _ready() -> void:
	# ربط الإشارات
	GameManger.coins_changed.connect(update_coins)
	GameManger.health_changed.connect(update_health)
	
	# تحديث القيم فوراً عند بدء المشهد
	update_coins(GameManger.points)
	update_health(GameManger.health)

func update_coins(points: int) -> void:
	coins_label.text = "Coins: " + str(points)

func update_health(current_health: int) -> void:
	if sprite_health:
		var rect = sprite_health.region_rect
		rect.position.y = (4 - current_health) * 25
		sprite_health.region_rect = rect

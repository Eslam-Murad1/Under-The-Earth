extends Label

@onready var coins_point: Label = $"."

func _ready() -> void:
	GameManger.coins_changed.connect(update_coins)
	update_coins()

func update_coins() -> void:
	coins_point.text = "Coins: " + str(GameManger.points)

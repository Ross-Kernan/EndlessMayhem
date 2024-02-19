extends Area2D

@onready var player = get_node("/root/Game/player")

func _on_body_entered(_body):
	player.MONEY += 1
	queue_free()

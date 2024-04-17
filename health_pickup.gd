extends Area2D

@onready var player = get_node("/root/Game/player")

func _on_body_entered(_body):
	player.MONEY += player.DROPV
	queue_free()

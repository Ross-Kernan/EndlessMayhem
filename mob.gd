extends CharacterBody2D

var health = 3

@onready var player = get_node("/root/Game/player")

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 100.0
	move_and_slide()
	
	if player.SCORE == player.ScoreReq:
		health += 1
		player.ScoreReq += player.ScoreReq * 2


func drop_health():
	const HDROP = preload("res://health_pickup.tscn")
	var health_drop = HDROP.instantiate()
	get_parent().call_deferred("add_child", health_drop)
	health_drop.global_position = position

func take_damage():
	health -= 1
	
	if health == 0:
		player.SCORE += 1
		drop_health()
		queue_free()

extends CharacterBody2D

var health = 500

@onready var player = get_node("/root/Game/player")


func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 100.0
	move_and_slide()


func take_damage():
	health -= 1
	
	if health == 0:
		player.SCORE += 1
		queue_free()

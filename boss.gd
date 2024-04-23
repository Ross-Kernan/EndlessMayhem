extends CharacterBody2D

var health = 300
var BOSS_SPEED = 100

@onready var player = get_node("/root/Game/player")

func _physics_process(_delta):
	#%BigRobot.set_texture(load("res://PixelPlat/Tiles/Characters/tile_0008.png"))
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * BOSS_SPEED
	move_and_slide()

func take_damage():
	health -= 1
	
	if health == 0:
		player.SCORE += 50
		queue_free()

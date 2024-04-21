extends CharacterBody2D

var health = 300
var BOSS_SPEED = 100

@onready var player = get_node("/root/Game/player")



func _physics_process(_delta):
	%BigRobot.set_texture(load("res://PixelPlat/Tiles/Characters/tile_0008.png"))
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 100.0 #BOSS_SPEED
	move_and_slide()
	
	if health <= 200:
		BOSS_SPEED += 10
		%BigRobot.set_texture(load("res://TestAssets/angry_boss.png"))

func take_damage():
	health -= 1
	
	if health == 0:
		player.SCORE += 30
		queue_free()

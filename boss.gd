extends CharacterBody2D

var health = 300

@onready var player = get_node("/root/Game/player")



func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 100.0
	move_and_slide()
	
	#if health <= 200:
		#%BigRobot.texture = load("res://PixelPlat/Tiles/Characters/tile_0024.png")


func take_damage():
	health -= 1
	
	if health == 0:
		player.SCORE += 30
		queue_free()

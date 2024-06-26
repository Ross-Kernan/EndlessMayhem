extends CharacterBody2D

var health = 3

var rand = randi_range(0, 4)

var sprite_arr = ["res://PixelPlat/Tiles/Characters/Mobs/rob1.png",
				"res://PixelPlat/Tiles/Characters/Mobs/rob2.png",
				"res://PixelPlat/Tiles/Characters/Mobs/blocky.png",
				"res://PixelPlat/Tiles/Characters/Mobs/demon1.png",
				"res://PixelPlat/Tiles/Characters/Mobs/demon2.png"]

@onready var player = get_node("/root/Game/player")

func _physics_process(_delta):
	%Robot.set_texture(load(sprite_arr[rand]))
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 100.0
	move_and_slide()
	
	if player.SCORE == player.ScoreReq:
		health += 1

func drop_health():
	const HDROP = preload("res://health_pickup.tscn")
	var health_drop = HDROP.instantiate()
	get_parent().call_deferred("add_child", health_drop)
	health_drop.global_position = position
	# These were originally intended to be health drops but now its money cause thats more interesting

func take_damage():
	health -= 1
	
	if health == 0:
		player.SCORE += 1
		drop_health()
		queue_free()

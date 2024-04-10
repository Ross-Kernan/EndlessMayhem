extends Node2D

@onready var player = get_node("/root/Game/player")


#func _ready():
	#process_mode = Node.PROCESS_MODE_PAUSABLE


func _physics_process(_delta):
	%Money.text = "Money: " + str(player.MONEY)

func spawn_mob():
	var robot = preload("res://mob.tscn").instantiate()
	robot.position = Vector2(randf_range(-100, 2000), randf_range(-100, 1000))
	add_child(robot)

func _on_timer_timeout():
	spawn_mob()

func _on_player_health_depleted():
	get_tree().change_scene_to_file("res://gameover.tscn")


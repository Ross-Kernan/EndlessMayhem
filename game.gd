extends Node2D

@onready var player = get_node("/root/Game/player")


func _physics_process(_delta):
	%Money.text = "Money: " + str(player.MONEY) + "\n----------------\nSpeed: " + str(player.SpeedCOST) + "\nFire Rate: " + str(player.FireRCOST) + "\nDrop Value: " + str(player.DropCOST)
	%Score.text = "SCORE\n" + str(player.SCORE)

func spawn_mob():
	var robot = preload("res://mob.tscn").instantiate()
	robot.position = Vector2(randf_range(-100, 2000), randf_range(-100, 1000))
	add_child(robot)

func spawn_boss():
	var boss = preload("res://boss.tscn").instantiate()
	boss.position = Vector2(randf_range(-100, 2000), randf_range(-100, 1000))
	add_child(boss)

func _on_timer_timeout():
	spawn_mob()

func _on_player_health_depleted():
	get_tree().change_scene_to_file("res://gameover.tscn")

func _on_boss_timer_timeout():
	spawn_boss()

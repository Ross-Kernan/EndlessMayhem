extends Node2D


func spawn_mob():
	var robot = preload("res://mob.tscn").instantiate()
	robot.position = Vector2(randf_range(-100, 2000), randf_range(-100, 1000))
	add_child(robot)
	
	
	




func _on_timer_timeout():
	spawn_mob()

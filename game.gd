extends Node2D


func spawn_mob():
	var robot = preload("res://mob.tscn").instantiate()
	robot.position = Vector2(randf_range(-100, 2000), randf_range(-100, 1000))
	add_child(robot)


func _on_timer_timeout():
	spawn_mob()
	


func _on_player_health_depleted():
	%GameOver.set_visible(true)
	get_tree().paused = true


func _on_button_pressed():
	%GameOver.set_visible(false)
	#get_tree().set_ = false
	get_tree().reload_current_scene()

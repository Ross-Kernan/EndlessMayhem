extends CharacterBody2D


var MAX_HEALTH = 100.0
var health = MAX_HEALTH
var SPEED = 350

const DAMAGE_RATE = 5.0
const HEALTH_REGEN = 1.0

signal health_depleted




func _ready():
	GunSlot1()
	GunSlot2()
	GunSlot3()
	GunSlot4()
	GunSlot5()


func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	move_and_slide()
	%HealthBar.value = health
	
	
	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * _delta
		if health <= 0.0:
			health_depleted.emit()


func health_regen():
	if health < MAX_HEALTH:
		health += HEALTH_REGEN
	elif health > MAX_HEALTH:
		health = MAX_HEALTH

func _on_timer_timeout():
	health_regen()
	

#func pause_game():
	#if Input.is_action_just_pressed("pause_game"):
		#get_tree().change_scene_to_file("res://test.tscn")





func GunSlot1():
	var StarterGun = preload("res://gun.tscn").instantiate()
	%PlayerGuns.progress_ratio = 0
	StarterGun.global_position = %PlayerGuns.global_position
	add_child(StarterGun)

func GunSlot2():
	var StarterGun = preload("res://gun.tscn").instantiate()
	%PlayerGuns.progress_ratio = .2
	StarterGun.global_position = %PlayerGuns.global_position
	add_child(StarterGun)

func GunSlot3():
	var StarterGun = preload("res://gun.tscn").instantiate()
	%PlayerGuns.progress_ratio = .4
	StarterGun.global_position = %PlayerGuns.global_position
	add_child(StarterGun)

func GunSlot4():
	var StarterGun = preload("res://gun.tscn").instantiate()
	%PlayerGuns.progress_ratio = .6
	StarterGun.global_position = %PlayerGuns.global_position
	add_child(StarterGun)

func GunSlot5():
	var StarterGun = preload("res://gun.tscn").instantiate()
	%PlayerGuns.progress_ratio = .8
	StarterGun.global_position = %PlayerGuns.global_position
	add_child(StarterGun)




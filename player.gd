extends CharacterBody2D

signal health_depleted

@export var SPEED = 120

var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()

	const DAMAGE_RATE = 5.0
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()


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
	
func _ready():
	GunSlot1()
	GunSlot2()
	GunSlot3()
	GunSlot4()
	GunSlot5()



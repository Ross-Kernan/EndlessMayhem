extends CharacterBody2D

@export var SPEED = 120

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


func _physics_process(_delta): # _delta may not work
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 350
	move_and_slide()


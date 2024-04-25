extends CharacterBody2D

var MAX_HEALTH = 100.0
var health = MAX_HEALTH

var SPEED = 350
var DROPV = 1

var MONEY = 0
var SCORE = 0
var ScoreReq = 50

var SpeedCOST = 5
var FireRCOST = 5
var DropCOST = 10

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
	
	if Input.is_action_just_pressed("+speed") && MONEY >= SpeedCOST:
		SPEED += 10
		MONEY -= SpeedCOST
		SpeedCOST += int(SpeedCOST * .5)
	elif Input.is_action_just_pressed("+fire_rate") && MONEY >= FireRCOST:
		# The actual fire rate is increased in the guns script because i could not figure it out
		# it also runs 5 times because the gun is instantiated 5 times, it works so just divide the upgrade
		# multiplier by 5
		MONEY -= FireRCOST
		FireRCOST += int(FireRCOST * .5)
	elif Input.is_action_just_pressed("+drop") && MONEY >= DropCOST:
		DROPV += 1
		MONEY -= DropCOST
		DropCOST += DropCOST * 2
	elif Input.is_action_just_pressed("+money"):
		MONEY += 9999
	
	
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

func GunSlot1():
	var Gun1 = preload("res://gun.tscn").instantiate()
	%PlayerGuns.progress_ratio = 0
	Gun1.global_position = %PlayerGuns.global_position
	add_child(Gun1)


func GunSlot2():
	var Gun2 = preload("res://gun.tscn").instantiate()
	%PlayerGuns.progress_ratio = .2
	Gun2.global_position = %PlayerGuns.global_position
	add_child(Gun2)


func GunSlot3():
	var Gun3 = preload("res://gun.tscn").instantiate()
	%PlayerGuns.progress_ratio = .4
	Gun3.global_position = %PlayerGuns.global_position
	add_child(Gun3)


func GunSlot4():
	var Gun4 = preload("res://gun.tscn").instantiate()
	%PlayerGuns.progress_ratio = .6
	Gun4.global_position = %PlayerGuns.global_position
	add_child(Gun4)


func GunSlot5():
	var Gun5 = preload("res://gun.tscn").instantiate()
	%PlayerGuns.progress_ratio = .8
	Gun5.global_position = %PlayerGuns.global_position
	add_child(Gun5)

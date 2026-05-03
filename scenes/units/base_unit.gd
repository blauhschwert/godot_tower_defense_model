class_name BaseUnit
extends Node2D

var ammo_type = [
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Bullets/bulletBeige.png"),
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Bullets/bulletBlue.png"),
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Bullets/bulletGreen.png"),
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Bullets/bulletRed.png"),
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Bullets/bulletSilver.png"),
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Bullets/bulletYellow.png"),
] 

var base_forms = [
	preload("res://assets/kenny_assets//Topdown Tanks/PNG/Tanks/base/base_light/tankBeige.png"),
	preload("res://assets/kenny_assets//Topdown Tanks/PNG/Tanks/base/base_light/tankBlack.png"),
	preload("res://assets/kenny_assets//Topdown Tanks/PNG/Tanks/base/base_light/tankBlue.png"),
	preload("res://assets/kenny_assets//Topdown Tanks/PNG/Tanks/base/base_light/tankGreen.png"),
	preload("res://assets/kenny_assets//Topdown Tanks/PNG/Tanks/base/base_light/tankRed.png"),
]

var base_super_forms = [
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Tanks/base/base_light/tankBeige.png"),
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Tanks/base/base_light/tankBlack.png"),
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Tanks/base/base_light/tankBlue.png"),
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Tanks/base/base_light/tankGreen.png"),
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Tanks/base/base_light/tankRed.png"),
]

var barel_forms = [
	preload("res://assets/kenny_assets//Topdown Tanks/PNG/Tanks/barel/barel_light/barrelBeige.png"),
	preload("res://assets/kenny_assets//Topdown Tanks/PNG/Tanks/barel/barel_light/barrelBlack.png"),
	preload("res://assets/kenny_assets//Topdown Tanks/PNG/Tanks/barel/barel_light/barrelBlue.png"),
	preload("res://assets/kenny_assets//Topdown Tanks/PNG/Tanks/barel/barel_light/barrelGreen.png"),
	preload("res://assets/kenny_assets//Topdown Tanks/PNG/Tanks/barel/barel_light/barrelRed.png"),
]

var barel_super_forms = [
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Tanks/barel/barel_super/barrelBeige_outline.png"),
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Tanks/barel/barel_super/barrelBlack_outline.png"),
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Tanks/barel/barel_super/barrelBlue_outline.png"),
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Tanks/barel/barel_super/barrelGreen_outline.png"),
	preload("res://assets/kenny_assets/Topdown Tanks/PNG/Tanks/barel/barel_super/barrelRed_outline.png"),
]

var can_shoot : bool = false

var ammo : int = 4
var ammo_box := []

var load_counter_max := 10

@onready var base = $Base
@onready var barel = $Barel
@onready var ammo_container = $AmmoCounter/AmmoBox/AmmoContainer

@onready var progress_bar = $AmmoCounter/LoadingBox/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	_create_ammo_counter()
	base.texture = base_forms.pick_random()
	barel.texture = barel_super_forms.pick_random()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_create_loading()


func _create_ammo_counter() -> void:
	for i in ammo:
		var bullet := TextureRect.new()
		bullet.texture = ammo_type[0]
		ammo_container.add_child(bullet)
	
	ammo_box = ammo_container.get_children()
	can_shoot = true

func shoot() -> void:
	if !ammo_box.is_empty():
		var test = ammo_box.pop_back()
		test.queue_free()

func _create_loading() -> void:
	if ammo_box.is_empty():
		progress_bar.show()
		progress_bar.value += 0.5 
	if progress_bar.value >= load_counter_max and ammo_box.size() < ammo:
		_create_ammo_counter()
		progress_bar.value = 0


func _on_shooting_timeout():
	if can_shoot:
		shoot()

func _on_shooting_range_area_entered(area: Area2D) -> void:
	if area is HurtBox:
		area.take_damage(3)

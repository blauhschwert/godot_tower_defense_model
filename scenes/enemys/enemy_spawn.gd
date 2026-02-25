class_name EnemySpawner
extends Node2D

signal spawning_phase_completed

@export_category("Debug")
@export var is_debug : bool = false

@export_category("Spawn Parameter")
@export var wave_data_array : Array = ["Enemy 1", "Enemy 2","Enemy 3", "Enemy 4"]
@export var default_spawn_delay : float = 1.0

@onready var enemy_spawn_timer : Timer = $EnemySpawnTimer

var current_spawn_delay : float = 0.0
var current_data_index : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	current_spawn_delay = default_spawn_delay
	
	enemy_spawn_timer.wait_time = current_spawn_delay
	
	enemy_spawn_timer.start()

func spawn_entity() -> void:
	if current_data_index >= wave_data_array.size():
		printerr("Index to large!")
		enemy_spawn_timer.stop()
		spawning_phase_completed.emit()
		return
	
	if is_debug:
		print_debug(wave_data_array[current_data_index])


func _on_enemy_spawn_timer_timeout():
	if is_debug:
		print_debug("Enemy spawned! WOOO : %s" % current_spawn_delay)
	
	spawn_entity()
	current_data_index += 1

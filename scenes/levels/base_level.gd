class_name BaseLevel
extends Node2D

const ENEMY_SCENE = preload("res://scenes/enemys/base_enemys/base_enemy_entitiy.tscn")

@onready var enemy_path: Path2D = $EnemyPath

func _on_enemy_spawn_timer_timeout() -> void:
	var enemy_test = ENEMY_SCENE.instantiate()
	enemy_path.add_child(enemy_test)

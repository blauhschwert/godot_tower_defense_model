class_name EnemyEntity
extends PathFollow2D

@export var speed : float = 25

var health = 5

func _ready() -> void:
	pass
	
func _process(_delta : float) -> void:
	progress += _delta * speed
	if progress_ratio >= 1.0:
		queue_free()
	
	if health <= 0:
		queue_free()

func _on_hurt_box_reduce_health(amount: int) -> void:
	health = health - amount

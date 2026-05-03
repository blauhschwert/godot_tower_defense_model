class_name BaseEnemyEntity
extends PathFollow2D

@export var speed : float = 55

func _ready() -> void:
	pass
	
func _process(_delta : float) -> void:
	progress += _delta * speed
	if progress_ratio >= 1.0:
		queue_free()

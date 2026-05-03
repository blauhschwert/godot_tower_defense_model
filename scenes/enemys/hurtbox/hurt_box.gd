class_name HurtBox
extends Area2D

signal reduce_health(amount : int)

func take_damage(amount : int) -> void:
	reduce_health.emit(amount)

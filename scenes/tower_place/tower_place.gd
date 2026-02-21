extends Area2D

const UNIT_SCENE := preload("res://scenes/units/base_unit.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("leftClick"):
		var unit := UNIT_SCENE.instantiate()
		add_child(unit)
		$Panel.hide()
		

extends KinematicBody2D

const SPEED = 2000
func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	if Input.is_action_pressed("ui_up"):
		move_and_slide(Vector2(0,-SPEED * delta))
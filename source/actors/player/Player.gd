extends KinematicBody2D

const SPEED = 2000
export (float) var multiplier
export (String, "Blue", "Red") var player_flag
func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	#Movement
	if Input.is_action_pressed("ui_up"):
		move_and_slide(Vector2(0,-SPEED * delta * multiplier))
	if Input.is_action_pressed("ui_right"):
		move_and_slide(Vector2(SPEED * delta * multiplier,0))
	if Input.is_action_pressed("ui_left"):
		move_and_slide(Vector2(-SPEED * delta * multiplier,0))
	if Input.is_action_pressed("ui_down"):
		move_and_slide(Vector2(0,SPEED * delta * multiplier))
	if Input.is_action_just_pressed("ui_accept"):
		interact()
func interact():
	var collider
	if is_colliding():
		print("colliding")
		collider = get_collider()
		if collider.is_in_group("totem"):
			collider.activate(player_flag)
	else:
		collider = null
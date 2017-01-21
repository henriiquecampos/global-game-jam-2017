extends KinematicBody2D

const SPEED = 2000
export (float) var multiplier
export (String, "player_one", "player_two") var player_flag
func _ready():
	add_to_group(player_flag)
	set_fixed_process(true)
func _fixed_process(delta):
	#Movement
	move(Vector2(0,0))
	if player_flag == "player_one":
		if Input.is_action_pressed("player_one_up"):
			move_and_slide(Vector2(0,-SPEED * delta * multiplier))
			get_node("Sprite").set_animation("running")
		elif Input.is_action_just_released("player_one_up"):
			get_node("Sprite").set_animation("iddle")
		if Input.is_action_pressed("player_one_right"):
			get_node("Sprite").set_flip_h(false)
			move_and_slide(Vector2(SPEED * delta * multiplier,0))
			get_node("Sprite").set_animation("running")
		elif Input.is_action_just_released("player_one_right"):
			get_node("Sprite").set_animation("iddle")
		if Input.is_action_pressed("player_one_left"):
			get_node("Sprite").set_flip_h(true)
			move_and_slide(Vector2(-SPEED * delta * multiplier,0))
			get_node("Sprite").set_animation("running")
		elif Input.is_action_just_released("player_one_left"):
			get_node("Sprite").set_animation("iddle")
		if Input.is_action_pressed("player_one_down"):
			get_node("Sprite").set_animation("running")
			move_and_slide(Vector2(0,SPEED * delta * multiplier))
		elif Input.is_action_just_released("player_one_down"):
			get_node("Sprite").set_animation("iddle")
		if Input.is_action_just_pressed("player_one_interact"):
			interact()
	elif player_flag == "player_two":
		if Input.is_action_pressed("player_two_up"):
			move_and_slide(Vector2(0,-SPEED * delta * multiplier))
		if Input.is_action_pressed("player_two_right"):
			move_and_slide(Vector2(SPEED * delta * multiplier,0))
		if Input.is_action_pressed("player_two_left"):
			move_and_slide(Vector2(-SPEED * delta * multiplier,0))
		if Input.is_action_pressed("player_two_down"):
			move_and_slide(Vector2(0,SPEED * delta * multiplier))
		if Input.is_action_just_pressed("player_two_interact"):
			interact()
func interact():
	var collider
	if is_colliding():
		collider = get_collider()
		if collider.is_in_group("totem"):
			collider.activate(player_flag)
	else:
		collider = null

func _on_Area_area_enter( area ):
	if area.has_method("be_a_wave"):
		if area.which_player != player_flag:
			queue_free()
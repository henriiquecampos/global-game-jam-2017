extends KinematicBody2D

export (Color) var player_one
export (Color) var player_two

export (ColorRamp) var player_one_ramp
export (ColorRamp) var player_two_ramp

export (Texture) var texture_blue
export (Texture) var texture_red
var player_flag

export (NodePath) var player_one_score_path
export (NodePath) var player_two_score_path

onready var player_one_score = get_node(player_one_score_path)
onready var player_two_score = get_node(player_two_score_path)

export (PackedScene) var waveScene
onready var wave = load (waveScene.get_path())

var explode_color
func activate(flag):
	get_node("samples").play("capturar torre")
	player_flag = flag
	add_to_group(player_flag)
	if flag == "player_one":
		explode_color = player_one
		get_node("aura").set_color_ramp(player_one_ramp)
		get_node("aura").set_emitting(true)
		get_node("aura").set_color(player_one)
		get_node("sprite").set_texture(texture_blue)
		get_node("time_charge").set_progress_texture(get_node("time_charge").blue_texture)
	elif flag == "player_two":
		explode_color = player_two
		get_node("aura").set_color_ramp(player_two_ramp)
		get_node("aura").set_emitting(true)
		get_node("aura").set_color(player_two)
		get_node("sprite").set_texture(texture_red)
		get_node("time_charge").set_progress_texture(get_node("time_charge").red_texture)
	get_node("timer").start()
	explode()
	
func explode():
	get_node("emiter").set_color(explode_color)
	get_node("emiter/timer").start()
	#get_node("samples").play("adquirir energia")
	
	var newWave = wave.instance()
	add_child(newWave)
	newWave.set_global_pos(get_global_pos())
	newWave.get_child(0).set_shape(CircleShape2D.new())
	newWave.which_player = player_flag
	if player_flag == "player_one":
		newWave.get_node("sprite").set_modulate(player_one)
	elif player_flag == "player_two":
		newWave.get_node("sprite").set_modulate(player_two)
	#get_node("emiter").set_lifetime(get_node("timer").get_wait_time())

func _on_timer_timeout():
	explode()
	get_node("sprite").set_modulate(Color(1.0, 1.0, 1.0))
	get_node("emiter").set_emitting(true)
	get_node("emiter").set_emitting(false)
#	if player_flag == "player_one":
#		player_one_score.score += 10
#	elif player_flag == "player_two":
#		player_two_score.score += 10
func _on_emiter_timer_timeout():
	#get_node("emiter").set_emitting(false)
	pass

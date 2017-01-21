extends KinematicBody2D

export (Color) var player_one
export (Color) var player_two
var player_flag

export (PackedScene) var waveScene
onready var wave = load (waveScene.get_path())

var explode_color
func activate(flag):
	player_flag = flag
	if flag == "player_one":
		explode_color = player_one
	elif flag == "player_two":
		explode_color = player_two
	get_node("sprite").set_modulate(Color(0.5, 0.5, 0.0))
	get_node("timer").start()
	
func explode():
	get_node("emiter").set_color(explode_color)
	get_node("emiter/timer").start()
	
	var newWave = wave.instance()
	add_child(newWave)
	newWave.set_global_pos(get_global_pos())
	newWave.get_child(0).set_shape(CircleShape2D.new())
	newWave.which_player = player_flag
	get_node("emiter").set_lifetime(get_node("timer").get_wait_time())

func _on_timer_timeout():
	explode()
	get_node("sprite").set_modulate(Color(1.0, 1.0, 1.0))
	get_node("emiter").set_emitting(true)

func _on_emiter_timer_timeout():
	#get_node("emiter").set_emitting(false)
	pass

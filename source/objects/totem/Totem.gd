extends KinematicBody2D

export (Color) var player_one
export (Color) var player_two

var explode_color
func activate(flag):
	if flag == "Blue":
		explode_color = player_one
	elif flag == "Red":
		explode_color = player_two
	get_node("sprite").set_modulate(Color(0.5, 0.5, 0.0))
	get_node("timer").start()
	

func explode():
	get_node("emiter").set_emitting(true)
	get_node("emiter").set_color(explode_color)
	get_node("emiter/timer").start()
	
func _on_timer_timeout():
	explode()
	get_node("sprite").set_modulate(Color(1.0, 1.0, 1.0))

func _on_emiter_timer_timeout():
	get_node("emiter").set_emitting(false)

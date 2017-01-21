extends Area2D

export (int) var max_radius
export (float) var grow_speed
export (float) var explosion_duration

var which_player

func be_a_wave():
	pass
func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var radius = get_shape(0).get_radius()
	if radius < max_radius:
		get_shape(0).set_radius( radius + grow_speed * delta)
	else:
		queue_free()
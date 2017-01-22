extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true)
	
func _process(delta):
	if Input.is_action_just_released("player_one_interact") or Input.is_action_just_released("player_two_interact"):
		get_tree().change_scene("res://levels/test_level/test_level.tscn")

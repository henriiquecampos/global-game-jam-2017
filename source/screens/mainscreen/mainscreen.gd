extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("AnimatedSprite").play("default")
	set_process(true)
func _process(delta):
	if Input.is_action_just_released("player_one_interact") or Input.is_action_just_released("player_two_interact"):
		gameplayBGM.play()
		get_tree().change_scene("res://levels/test_level/test_level.tscn")

func _on_Timer_timeout():
	get_node("AnimatedSprite").play("default")


func _on_AnimatedSprite_finished():
	get_node("AnimatedSprite").stop()
	get_node("Timer").start()

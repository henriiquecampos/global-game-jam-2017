extends Sprite

export (String, "player_one_score", "player_two_score") var which_player
onready var score = globals.get(which_player)

func update_score(value):
	score = value
	set_frame(score)
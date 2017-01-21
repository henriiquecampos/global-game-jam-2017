extends Sprite

var score = 0 setget set_score

func set_score(value):
	score = value
	set_frame(score)
extends Label

var score = 0 setget set_score

func _ready():
	set_text(str(score))
func set_score(value):
	score = value
	set_text(str(score))
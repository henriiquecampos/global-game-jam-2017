extends Label

var score = 0 setget set_score
export (String, "player_one", "player_two") var which_player_group
func _ready():
	set_text(str(score))
	set_process(true)
	
func _process(delta):
	self.score = str(get_tree().get_nodes_in_group(which_player_group).size() -1)
func set_score(value):
	score = value
	set_text(str(score))
extends Node

var player_one_score = 0
var player_two_score = 0

func increase_score(flag):
	if flag == "player_one":
		player_two_score += 1
		get_parent().get_node("test_level/score/score_player_two").update_score(player_two_score)
	elif flag == "player_two":
		player_one_score += 1
		get_parent().get_node("test_level/score/score_player_one").update_score(player_one_score)
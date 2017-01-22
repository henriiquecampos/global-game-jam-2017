extends Node

var player_one_score = 0
var player_two_score = 0

func increase_score(flag):
	if flag == "player_one":
		player_two_score += 1
		if player_two_score >= 5:
			player_two_score = 0
			player_one_score = 0
			get_tree().change_scene("res://screens/winscreen/player_wave_wins.tscn")
		get_parent().get_node("test_level/score/score_player_two").update_score(player_two_score)
		get_parent().get_node("test_level/score/score_player_one").update_score(player_one_score)
	elif flag == "player_two":
		player_one_score += 1
		if player_one_score >= 5:
			player_two_score = 0
			player_one_score = 0
			get_tree().change_scene("res://screens/winscreen/player_shock_wins.tscn")
		get_parent().get_node("test_level/score/score_player_one").update_score(player_one_score)
		get_parent().get_node("test_level/score/score_player_two").update_score(player_two_score)
	print(player_one_score)
	print(player_two_score)
extends Node2D

var json_file_path : String
var music_file_path : String

var initial_speed : float
var max_speed : float

var combo = 0
var max_combo = 0
var score = 0

# [Miss, Ok, Good, Perfect]
var hit = [0, 0, 0, 0]
var rank = "NA"

func eval_rank():
	var total_hits = float(hit[0] + hit[1] + hit[2] + hit[3])  # Total hits (Miss, Ok, Good, Perfect)

	# 1. Calculate the success rate
	var success_rate = float(hit[1] + hit[2] + hit[3]) / total_hits  # Success rate from "Ok", "Good", "Perfect" hits
	
	var ranking = ["S", "A+", "A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D"]
	var threshold = [.91, .82, .73, .64, .55, .46, .37, .28, .19, .1, 0]

	for i in range(len(ranking)):
		if success_rate >= threshold[i]:
			return ranking[i]

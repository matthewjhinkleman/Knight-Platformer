extends Node

signal score_changed(new_score)

var total_score = 0
var level_score = 0

func add_point():
	total_score += 1
	level_score += 1
	emit_signal("score_changed", total_score)
	print(total_score)

func reset_level_score():
	total_score -= level_score
	level_score = 0
	emit_signal("score_changed", total_score)

func start_level():
	level_score = 0
	emit_signal("score_changed", total_score)

func reset():
	total_score = 0
	level_score = 0
	emit_signal("score_changed", total_score)

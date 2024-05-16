extends Node


@onready var score_label = $ScoreLabel


var score: int = 0


func add_point() -> void:
	score += 1
	score_label.text = "You collected " + str(score) + " coins."

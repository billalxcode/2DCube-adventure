extends Label

var score = 0

func set_score():
	score = score + 2
	set_text("Score: " + str(score))

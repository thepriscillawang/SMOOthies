extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Algorithm.calculate_sold_cups()
	pass # Replace with function body.

func _on_FastForwardButton_pressed():
	if (Global.curr_day < Global.total_days):
		# generate whether or not there is random ingredient event
		SceneLoader._change_scene("EndOfDayReport")
	else:
		SceneLoader._change_scene("Report")

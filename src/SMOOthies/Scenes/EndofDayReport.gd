extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/EODReportLabel.text = str(Global.curr_day_num_cups_sold) + " cups of sMOOthies to " + str(Global.curr_day_total_pop) + " potential customers." 
	pass # Replace with function body.


func _on_OK_pressed():
	SceneLoader._change_scene("IngredientsEvent")

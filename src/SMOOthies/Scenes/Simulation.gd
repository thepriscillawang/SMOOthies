extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Algorithm.calculate_sold_cups()
	pass # Replace with function body.

func _on_FastForwardButton_pressed():
	go_to_report()
	
func go_to_report():
	if (Global.curr_day < Global.total_days):
		# generate whether or not there is random ingredient event
		SceneLoader._change_scene("EndOfDayReport")
	else:
		SceneLoader._change_scene("Report")

func _process(delta):
	var text = str($Timer.time_left)
#
var am_pm = "am"
var hour = 8
var minute = 0
var week = 0

func _physics_process(_delta):
	var minute_string = ""
	if minute < 10:
		minute_string = "0" + str(int(minute))
	else: 
		minute_string = str(int(minute))
	$Clock.text = str(hour) + " : " + minute_string + " " + am_pm
	minute += 1
	if int(minute) == 60:
		minute = 0
		hour += 1
	if hour == 12:
		am_pm = "pm"
	if hour == 13:
		hour = 1
	if hour == 7:
		$Timer.stop()
		$Timer.emit_signal("timeout")

	
func _on_Timer_timeout():
	go_to_report()

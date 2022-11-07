extends Node2D

var is_fast_forward = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Character_01.position.y = 435
	$Character_02.position.y = 395
	$Character_03.position.y = 384
	$Character_04.position.y = 351
	$FastForwardButton.disabled = false
	$NormalSpeedButton.disabled = true
	Algorithm.calculate_sold_cups()

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
	if (is_fast_forward):
		minute += 1
	else:
		minute += 0.1
	
	if int(minute) == 60:
		minute = 0
		hour += 1
	if hour == 12:
		am_pm = "pm"
	if hour == 13:
		hour = 1
	if (hour == 6 && int(minute) == 0):
		$Timer.stop()
		$Timer.emit_signal("timeout")
		
func _on_Timer_timeout():
	go_to_report()


func _on_NormalSpeedButton_pressed():
	is_fast_forward = false
	$Timer2.wait_time = 0.1
	$FastForwardButton.disabled = false
	$NormalSpeedButton.disabled = true
	$SpeedButton.play()


func _on_FastForwardButton_pressed():
	is_fast_forward = true
	$Timer2.wait_time = 0.05
#	$Timer2.start()
	$FastForwardButton.disabled = true
	$NormalSpeedButton.disabled = false
	$SpeedButton.play()


var position_x = 0
var pause_for_purchase = 10
var is_off_screen = true
var curr_character = 1
func _on_Timer2_timeout():
	if (is_off_screen == true):
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var num = rng.randi_range(1, 4)
		curr_character = num
		is_off_screen = false
	else:
		is_off_screen = false
		if (curr_character == 1):
			$Character_01.visible = true
		elif (curr_character == 2):
			$Character_02.visible = true
		elif (curr_character == 3):
			$Character_03.visible = true
		elif (curr_character == 4):
			$Character_04.visible = true
			#$Character_02.position.y = 435
		if (position_x == 550 ):
			if (pause_for_purchase <= 10  && pause_for_purchase >= 0):
				pause_for_purchase = pause_for_purchase - 1
				if (curr_character == 1):
					$Character_01.set_frame(1)
					$Character_01.playing = false
				elif (curr_character == 2):
					$Character_02.set_frame(1)
					$Character_02.playing = false
				elif (curr_character == 3):
					$Character_03.set_frame(1)
					$Character_03.playing = false
				elif (curr_character == 4):
					$Character_04.set_frame(1)
					$Character_04.playing = false
			else: 
				pause_for_purchase = 10
				position_x = position_x + 50
				if (curr_character == 1):
					$Character_01.playing = true
					$Character_01.position.x = position_x
				elif (curr_character == 2):
					$Character_02.playing = true
					$Character_02.position.x = position_x
				elif (curr_character == 3):
					$Character_03.playing = true
					$Character_03.position.x = position_x
				elif (curr_character == 4):
					$Character_04.playing = true
					$Character_04.position.x = position_x
		else:
			if (position_x == 1100):
				is_off_screen = true
				position_x = 0
				if (curr_character == 1):
					$Character_01.visible = false
				elif (curr_character == 2):
					$Character_02.visible = false
				elif (curr_character == 3):
					$Character_03.visible = false
				elif (curr_character == 4):
					$Character_04.visible = false
			else:
				if (curr_character == 1):
					$Character_01.position.x = position_x
				elif (curr_character == 2):
					$Character_02.position.x = position_x
				elif (curr_character == 3):
					$Character_03.position.x = position_x
				elif (curr_character == 4):
					$Character_04.position.x = position_x
				position_x = position_x + 50


extends Node2D

var curr_index
var curr_event

func _ready():
	Global._reset_values()
	MainMusic.play_music()

	var copy_of_events = Global._events.duplicate(true)

	randomize()
	for _i in range(14):
		get_event(copy_of_events)
		Global.special_events.append(curr_event)
		copy_of_events.remove(curr_index)
		
func get_event(events_list):
	curr_index = randi() % events_list.size()
	curr_event = events_list[curr_index]

func _load_Main():
	var Main = SceneLoader._load_scene("Main")
	Main.name = "Main"

func _on_StartButton_pressed():
	_play_sound()

func _play_sound():
	$StartButtonSound.stream = load("res://Sounds/softbutton.wav")
	$StartButtonSound.connect("finished", self, "_load_intro_scene")
	$StartButtonSound.play()

func _load_intro_scene():
#	get_tree().change_scene("res://Intro.tscn") 
	SceneLoader._change_scene("Intro")

extends Node

var total_days = 0
var curr_day = 1
var curr_money = 100.00
var special_events = []

var curr_mango = 0
var curr_pineapple = 0
var curr_dragonfruit = 0
var curr_milk = 0
var curr_ice = 0
var curr_cup = 0

# a list of special events to generate from
var _events = [
	{event ="event 1", populatin =1}, 
	{event = "event 2", population =2}, 
	{event = "event 3",population = 3},
	{event = "none", population = 4}
]

#generate random events
func _ready():
	print("global called")
	randomize()
	for i in range(14):
		special_events.append(get_events())
	print(typeof(special_events))

#generates list of events 
func get_events():
	var random_events = _events[randi() % _events.size()]
	return random_events

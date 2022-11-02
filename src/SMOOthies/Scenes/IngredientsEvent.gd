extends Node2D

var _events = Global._ingredient_events
var rng = RandomNumberGenerator.new()
var _ingredient_events = [
	{event = "Bad luck! The milk has spoiled. Make sure to restock!", id = 0},
	{event = "You got an overripe batch of mangoes! You can’t use rotten fruit. Restock.", id =1},
	{event = "Thieving birds! They made off with the dragon fruit! Order more.", id = 2}
]

func _ready():
	# Reset ice
	Global.curr_ice = 0
	# should pick whether it should have extra event
	rng.randomize()
	var my_random_number = rng.randi_range(0,2)
	print("random number is: " + str(my_random_number))
	if (my_random_number == 0):
		$IngredientsEventLabel.text = _events[randi() % _events.size()].event
	else:
		$IngredientsEventLabel.text = ""

func reset_values(id):
	if (id == 0):
		Global.curr_milk = 0
	elif (id == 1):
		Global.curr_mango = 0
	elif (id == 2):
		Global.curr_dragonfruit = 0

func _on_OrderIngredientsButton_pressed():
	SceneLoader._change_scene("Ingredients")

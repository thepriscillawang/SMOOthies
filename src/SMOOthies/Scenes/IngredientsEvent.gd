extends Node2D

var _events = Global.ingredient_events
var rng = RandomNumberGenerator.new()

func _ready():
	# Reset ice
	Global.inventory_ice = 0
	# should pick whether it should have extra event
	rng.randomize()
	var my_random_number = rng.randi_range(0,5)
	if (my_random_number == 0 || my_random_number == 1 || my_random_number == 2):
		$IngredientsEventLabel.text = _events[my_random_number].event
		reset_values(my_random_number)
	else:
		$IngredientsEventLabel.text = ""
	Global.reset_curr_ingredients()

func reset_values(id):
	if (id == 0):
		Global.inventory_milk = 0
	elif (id == 1):
		Global.inventory_mango = 0
	elif (id == 2):
		Global.inventory_dragonfruit = 0

func _on_OrderIngredientsButton_pressed():
	SceneLoader._change_scene("Ingredients")

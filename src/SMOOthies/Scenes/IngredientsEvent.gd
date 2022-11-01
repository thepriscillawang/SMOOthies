extends Node2D

var _events = Global._ingredient_events

func _ready():
	$IngredientsEventLabel.text = _events[randi() % _events.size()].event

func _on_OrderIngredientsButton_pressed():
	SceneLoader._change_scene("Ingredients")

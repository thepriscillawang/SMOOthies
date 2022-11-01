extends Node2D

func _ready():
	pass # Replace with function body.


func _on_OrderIngredientsButton_pressed():
	SceneLoader._change_scene("Ingredients")

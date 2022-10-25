extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_OrderIngredients_pressed():
		SceneLoader._load_scene("Ingredients")

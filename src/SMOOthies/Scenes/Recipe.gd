extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	print("recipe")
	pass # Replace with function body.

func _on_BackToStoreButton_pressed():
	SceneLoader._change_scene("Ingredients")
	pass # Replace with function body.

func _on_HelpIngredientButton_pressed():
	SceneLoader._change_scene("RecipeHelp")
	pass # Replace with function body.


func _on_ConfirmRecipeButton_pressed():
	SceneLoader._change_scene("Simulation")
	pass # Replace with function body.

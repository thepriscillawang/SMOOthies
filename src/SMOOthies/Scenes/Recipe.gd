extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	update_amount_label("mango")
	update_amount_label("pineapple")
	update_amount_label("dragonfruit")
	update_amount_label("milk")
	update_amount_label("ice")
	check_ingredient_oz()

func check_ingredient_oz():
	var total_ingredient = Global.mango_recipe_amount + Global.pineapple_recipe_amount + Global.dragonfruit_recipe_amount + Global.milk_recipe_amount + Global.ice_recipe_amount
	$OzLabel.text = str(total_ingredient) + " oz out of 16 oz of ingredients selected."
	if (total_ingredient == 16):
		$ConfirmRecipeButton.disabled = false
	else:
		$ConfirmRecipeButton.disabled = true

func _on_BackToStoreButton_pressed():
	$IngredientsMusic.connect("finished", self, "_load_Ingredients_scene")
	$IngredientsMusic.play()

func _load_Ingredients_scene():
	SceneLoader._change_scene("Ingredients")
	
func _on_HelpIngredientButton_pressed():
	$IngredientsMusic.connect("finished", self, "_load_RecipeHelp_scene")
	$IngredientsMusic.play()
	
func _load_RecipeHelp_scene():
	SceneLoader._change_scene("RecipeHelp")
	
func _on_ConfirmRecipeButton_pressed():
	$IngredientsMusic.connect("finished", self, "_load_Simulation_scene")
	$IngredientsMusic.play()
	
func _load_Simulation_scene():
	SceneLoader._change_scene("Simulation")
	
	
func update_amount_label(ingredient):
	check_ingredient_oz()
	if (ingredient == "mango"):
		$Mango/MangoAmountRecipe.text = str(Global.mango_recipe_amount)
	elif( ingredient == "pineapple"):
		$Pineapple/PineappleAmountRecipe.text = str(Global.pineapple_recipe_amount)
	elif( ingredient == "dragonfruit"):
		$Dragonfruit/DragonfruitAmountRecipe.text = str(Global.dragonfruit_recipe_amount)
	elif( ingredient == "milk"):
		$Milk/MilkAmountRecipe.text = str(Global.milk_recipe_amount)
	elif( ingredient == "ice"):
		$Ice/IceAmountRecipe.text = str(Global.ice_recipe_amount)
		
func _on_SubMangoRecipe_pressed():
	if ( Global.mango_recipe_amount > 0):
		Global.mango_recipe_amount = Global.mango_recipe_amount - 1
		update_amount_label("mango")
		$IngredientsMusic.play()

func _on_AddMangoRecipe_pressed():
	Global.mango_recipe_amount = Global.mango_recipe_amount + 1
	update_amount_label("mango")
	$IngredientsMusic.play()

func _on_SubPineappleRecipe_pressed():
	if ( Global.pineapple_recipe_amount > 0):
		Global.pineapple_recipe_amount = Global.pineapple_recipe_amount - 1
		update_amount_label("pineapple")
		$IngredientsMusic.play()

func _on_AddPineappleRecipe_pressed():
	Global.pineapple_recipe_amount = Global.pineapple_recipe_amount + 1
	update_amount_label("pineapple")
	$IngredientsMusic.play()

func _on_SubDragonfruitRecipe_pressed():
	if ( Global.dragonfruit_recipe_amount > 0):
		Global.dragonfruit_recipe_amount = Global.dragonfruit_recipe_amount - 1
		update_amount_label("dragonfruit")
		$IngredientsMusic.play()
		
func _on_AddDragonfruitRecipe_pressed():
	Global.dragonfruit_recipe_amount = Global.dragonfruit_recipe_amount + 1
	update_amount_label("dragonfruit")
	$IngredientsMusic.play()

func _on_SubMilkRecipe_pressed():
	if ( Global.milk_recipe_amount > 0):
		Global.milk_recipe_amount = Global.milk_recipe_amount - 1
		update_amount_label("milk")
		$IngredientsMusic.play()

func _on_AddMilkRecipe_pressed():
	Global.milk_recipe_amount = Global.milk_recipe_amount + 1
	update_amount_label("milk")
	$IngredientsMusic.play()

func _on_SubIceRecipe_pressed():
	if ( Global.ice_recipe_amount > 0):
		Global.ice_recipe_amount = Global.ice_recipe_amount - 1
		update_amount_label("ice")
		$IngredientsMusic.play()
	
func _on_AddIceRecipe_pressed():
	Global.ice_recipe_amount = Global.ice_recipe_amount + 1
	update_amount_label("ice")
	$IngredientsMusic.play()

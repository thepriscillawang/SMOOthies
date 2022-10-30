extends Node2D



func _update_ingredient_label(ingredient):
	if (ingredient == "mango"):
		$IngredientsPurchase/CurrMangoLabel.text = str(Global.curr_mango)
	elif(ingredient ==  "pineapple"):
		$IngredientsPurchase/CurrPineappleLabel.text = str(Global.curr_pineapple)
	elif(ingredient == "dragonfruit"):
		$IngredientsPurchase/CurrDragonfruitLabel.text = str(Global.curr_dragonfruit)
	elif(ingredient == "milk"):
		$IngredientsPurchase/CurrMilkLabel.text = str(Global.curr_milk)
	elif(ingredient == "ice"):
		$IngredientsPurchase/CurrIceLabel.text = str(Global.curr_ice)
	elif(ingredient == "cup"):
		$IngredientsPurchase/CurrCupLabel.text = str(Global.curr_cup)

func _ready():
	_update_ingredient_label("mango")
	_update_ingredient_label("pineapple")
	_update_ingredient_label("dragonfruit")
	_update_ingredient_label("milk")
	_update_ingredient_label("ice")
	_update_ingredient_label("cup")
	print("Hello, ingredients!")

func _load_Ingredients():
	var Ingredients = SceneLoader._load_scene("Ingredients")
	Ingredients.name = "Ingredients"


func _on_ConfirmPurchase_pressed():
	_play_sound()
	
	

func _play_sound():
	$IngredientsMusic.stream = load("res://sounds/softbutton.wav")
	$IngredientsMusic.connect("finished", self, "_load_Main_scene")
	$IngredientsMusic.play()

func _load_Main_scene():
#	get_tree().change_scene("res://Main.tscn") 
	SceneLoader._change_scene("Main")

#MANGO AREA
func _on_SubMangos_pressed():
	if (Global.curr_mango > 0 ):
		Global.curr_mango = Global.curr_mango -1
	_update_ingredient_label("mango")
	print("- Mango pressed. Total Mango: ",  Global.curr_mango)

func _on_AddMangos_pressed():
	Global.curr_mango = Global.curr_mango + 1
	_update_ingredient_label("mango")
	print("+ Mango pressed. Total Mango: ",  Global.curr_mango)
	
func _on_SubPineapple_pressed():
	if (Global.curr_pineapple > 0 ):
		Global.curr_pineapple = Global.curr_pineapple -1
	_update_ingredient_label("pineapple")
	print("- Pineapple pressed. Total Pineapple: ",  Global.curr_pineapple)

func _on_AddPineapple_pressed():
	Global.curr_pineapple = Global.curr_pineapple + 1
	_update_ingredient_label("pineapple")
	print("+ Pineapple pressed. Total Pineapple: ",  Global.curr_pineapple)

func _on_SubDragonfruit_pressed():
	if (Global.curr_dragonfruit > 0 ):
		Global.curr_dragonfruit = Global.curr_dragonfruit -1
	_update_ingredient_label("dragonfruit")
	print("- Dragonfruit pressed. Total Dragonfruit: ",  Global.curr_dragonfruit)

func _on_AddDragonfruit_pressed():
	Global.curr_dragonfruit = Global.curr_dragonfruit + 1
	_update_ingredient_label("dragonfruit")
	print("+ Dragonfruit pressed. Total Dragonfruit: ",  Global.curr_dragonfruit)

func _on_SubMilk_pressed():
	if (Global.curr_milk > 0 ):
		Global.curr_milk = Global.curr_milk - 1
	_update_ingredient_label("milk")
	print("+ Milk pressed. Total Milk: ",  Global.curr_milk)

func _on_AddMilk_pressed():
	Global.curr_milk = Global.curr_milk + 1
	_update_ingredient_label("milk")
	print("+ Milk pressed. Total Milk: ",  Global.curr_milk)

func _on_SubIce_pressed():
	if (Global.curr_ice > 0):
		Global.curr_ice = Global.curr_ice - 1
	_update_ingredient_label("ice")
	print("- Ice pressed. Total Ice: ",  Global.curr_ice)
	
func _on_AddIce_pressed():
	Global.curr_ice = Global.curr_ice + 1
	_update_ingredient_label("ice")
	print("+ Ice pressed. Total Ice: ",  Global.curr_ice)

func _on_SubCup_pressed():
	if (Global.curr_cup > 0):
		Global.curr_cup = Global.curr_cup - 1
	_update_ingredient_label("cup")
	print("- Cup pressed. Total Cup: ",  Global.curr_cup)



func _on_AddCup_pressed():
	Global.curr_cup = Global.curr_cup + 1
	_update_ingredient_label("cup")
	print("+ Cup pressed. Total Cup: ",  Global.curr_cup)


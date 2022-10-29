extends Node2D

func _update_ingredient_label(ingredient):
	if (ingredient == "mango"):
		$IngredientsPurchase/CurrMangoLabel.text = str(Global.curr_mango)
	elif(ingredient ==  "pineapple"):
		$IngredientsPurchase/CurrPineappleLabel.text = str(Global.curr_pineapple)
#	elif(ingredient == "dragonfruit"):

func _ready():
	_update_ingredient_label("mango")
	_update_ingredient_label("pineapple")
	print("Hello, ingredients!")

func _load_Ingredients():
	var Ingredients = SceneLoader._load_scene("Ingredients")
	Ingredients.name = "Ingredients"


func _on_ConfirmPurchase_pressed():
	_play_sound()

func _play_sound():
	$IngredientsMusic.stream = load("res://sounds/startsound.wav")
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

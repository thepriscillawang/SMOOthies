extends Node2D


func update_ingredient_label(ingredient):
	$MoneyLabel.text = "$ " + str(Global.curr_money)
	if (ingredient == "mango"):
		print("in mango")
		$IngredientsPurchase/CurrMangoLabel.text = str(Global.curr_mango)
		$YouHave/CurrMango.text = str(Global.inventory_mango)
	elif(ingredient ==  "pineapple"):
		$IngredientsPurchase/CurrPineappleLabel.text = str(Global.curr_pineapple)
		$YouHave/CurrPineapple.text = str(Global.inventory_pineapple)
	elif(ingredient == "dragonfruit"):
		$IngredientsPurchase/CurrDragonfruitLabel.text = str(Global.curr_dragonfruit)
		$YouHave/CurrDragonfruit.text = str(Global.inventory_dragonfruit)
	elif(ingredient == "milk"):
		$IngredientsPurchase/CurrMilkLabel.text = str(Global.curr_milk)
		$YouHave/CurrMilk.text = str(Global.inventory_milk)
	elif(ingredient == "ice"):
		$IngredientsPurchase/CurrIceLabel.text = str(Global.curr_ice)
		$YouHave/CurrIce.text = str(Global.inventory_ice)
	elif(ingredient == "cup"):
		$IngredientsPurchase/CurrCupLabel.text = str(Global.curr_cup)
		$YouHave/CurrCup.text = str(Global.inventory_cup)

func _ready():
	#update day
	Global.curr_day = Global.curr_day + 1
	
	print("in ready")
	update_ingredient_label("mango")
	update_ingredient_label("pineapple")
	update_ingredient_label("dragonfruit")
	update_ingredient_label("milk")
	update_ingredient_label("ice")
	update_ingredient_label("cup")
	
	# update day label
	$DayLabel.text = "Day " + str(Global.curr_day) + " of " + str(Global.total_days)
	$MoneyLabel.text = "$ " + str(Global.curr_money)
	$EventLabel.text = "Upcoming Event: " + str(Global.special_events[Global.curr_day - 1].event)
	
func _load_Ingredients():
	var Ingredients = SceneLoader._load_scene("Ingredients")
	Ingredients.name = "Ingredients"


func _on_ConfirmPurchase_pressed():
	_play_sound()
	

func _play_sound():
	$IngredientsMusic.stream = load("res://sounds/softbutton.wav")
	$IngredientsMusic.connect("finished", self, "_load_Recipe_scene")
	$IngredientsMusic.play()
	
func _load_Recipe_scene():
#	get_tree().change_scene("res://Main.tscn") 
	SceneLoader._change_scene("Recipe")

#MANGO AREA
func _on_SubMangos_pressed():
	if (Global.curr_mango > 9 ):
		Global.curr_mango = Global.curr_mango -10
		Algorithm.buy_ingredient("mango", "sub")
	update_ingredient_label("mango")
	print("- Mango pressed. Total Mango: ",  Global.curr_mango)
	$IngredientsMusic.play()
	
func _on_AddMangos_pressed():
	Global.curr_mango = Global.curr_mango + 10
	print("+ Mango pressed. Total Mango: ",  Global.curr_mango)
	Algorithm.buy_ingredient("mango", "add")
	update_ingredient_label("mango")
	$IngredientsMusic.play()
	
func _on_SubPineapple_pressed():
	if (Global.curr_pineapple > 9 ):
		Global.curr_pineapple = Global.curr_pineapple -10
		Algorithm.buy_ingredient("pineapple", "sub")
	update_ingredient_label("pineapple")
	print("- Pineapple pressed. Total Pineapple: ",  Global.curr_pineapple)
	$IngredientsMusic.play()
	
func _on_AddPineapple_pressed():
	Global.curr_pineapple = Global.curr_pineapple + 10
	Algorithm.buy_ingredient("pineapple", "add")
	update_ingredient_label("pineapple")
	print("+ Pineapple pressed. Total Pineapple: ",  Global.curr_pineapple)
	$IngredientsMusic.play()

func _on_SubDragonfruit_pressed():
	if (Global.curr_dragonfruit > 9 ):
		Global.curr_dragonfruit = Global.curr_dragonfruit -10
		Algorithm.buy_ingredient("dragonfruit", "sub")
	update_ingredient_label("dragonfruit")
	print("- Dragonfruit pressed. Total Dragonfruit: ",  Global.curr_dragonfruit)
	$IngredientsMusic.play()

func _on_AddDragonfruit_pressed():
	Global.curr_dragonfruit = Global.curr_dragonfruit + 10
	Algorithm.buy_ingredient("dragonfruit", "add")
	update_ingredient_label("dragonfruit")
	print("+ Dragonfruit pressed. Total Dragonfruit: ",  Global.curr_dragonfruit)
	$IngredientsMusic.play()

func _on_SubMilk_pressed():
	if (Global.curr_milk > 9 ):
		Global.curr_milk = Global.curr_milk - 10
		Algorithm.buy_ingredient("milk", "sub")
	update_ingredient_label("milk")
	print("+ Milk pressed. Total Milk: ",  Global.curr_milk)
	$IngredientsMusic.play()

func _on_AddMilk_pressed():
	Global.curr_milk = Global.curr_milk + 10
	Algorithm.buy_ingredient("milk", "add")
	update_ingredient_label("milk")
	print("+ Milk pressed. Total Milk: ",  Global.curr_milk)
	$IngredientsMusic.play()

func _on_SubIce_pressed():
	if (Global.curr_ice > 9):
		Global.curr_ice = Global.curr_ice - 10
		Algorithm.buy_ingredient("ice", "sub")
	update_ingredient_label("ice")
	print("- Ice pressed. Total Ice: ",  Global.curr_ice)
	$IngredientsMusic.play()
	
func _on_AddIce_pressed():
	Global.curr_ice = Global.curr_ice + 10
	Algorithm.buy_ingredient("ice", "add")
	update_ingredient_label("ice")
	print("+ Ice pressed. Total Ice: ",  Global.curr_ice)
	$IngredientsMusic.play()

func _on_SubCup_pressed():
	if (Global.curr_cup > 9):
		Global.curr_cup = Global.curr_cup - 10
		Algorithm.buy_ingredient("cup", "sub")
	update_ingredient_label("cup")
	print("- Cup pressed. Total Cup: ",  Global.curr_cup)
	$IngredientsMusic.play()

func _on_AddCup_pressed():
	Global.curr_cup = Global.curr_cup + 10
	Algorithm.buy_ingredient("cup", "add")
	update_ingredient_label("cup")
	print("+ Cup pressed. Total Cup: ",  Global.curr_cup)
	$IngredientsMusic.play()

func _on_HelpButton_pressed():
	SceneLoader._change_scene("IngredientsHelp")

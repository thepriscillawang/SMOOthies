extends Node

var price_mango = Global.price_mango
var price_pineapple = Global.price_pineapple
var price_dragonfruit = Global.price_dragonfruit
var price_milk = Global.price_milk
var price_ice = Global.price_ice
var price_cup = Global.price_cup

var player_smoothie_recipe = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func render_player_recipe():
	var player_recipe = []
	for _i in Global.mango_recipe_amount:
		player_recipe.append("mango")
	for _i in Global.pineapple_recipe_amount:
		player_recipe.append("pineapple")
	for _i in Global.dragonfruit_recipe_amount:
		player_recipe.append("dragonfruit")
	for _i in Global.milk_recipe_amount:
		player_recipe.append("milk")
	for _i in Global.ice_recipe_amount:
		player_recipe.append("ice")
	return player_recipe
	
func compare_recipes():
	var perfect_recipe = ["mango","mango","mango","mango","pineapple","pineapple","pineapple","pineapple","pineapple","pineapple","dragonfruit","dragonfruit","dragonfruit","milk","milk","ice"]
	var player_recipe = render_player_recipe()
	print(player_recipe)
	var num_same_item = 0
	
	for i in player_recipe:
		print(i)
		if perfect_recipe.has(i):
			#remove 
			perfect_recipe.remove(i)
			print(perfect_recipe)
			num_same_item = num_same_item + 1
			print("num_same_item: " + str(num_same_item))
		else:
			print('nothing to remove')
	
	var perc_similar = num_same_item / 16.0
		 
	print("percentage similar: " + str(perc_similar) )
	
#buy 10 at a time
func buy_ingredient(ingredient, add_or_sub):
	print(ingredient)
	update_inventory(ingredient, add_or_sub)
	if (ingredient == "mango"):
		var bulk_price_mango = price_mango * 10
		update_money(bulk_price_mango, add_or_sub)
	elif(ingredient == "pineapple"):
		var bulk_price_pineapple = price_pineapple * 10
		update_money(bulk_price_pineapple, add_or_sub)
	elif(ingredient == "dragonfruit"):
		var bulk_price_dragonfruit = price_dragonfruit * 10
		update_money(bulk_price_dragonfruit, add_or_sub)
	elif(ingredient == "milk"):
		var bulk_price_milk = price_milk * 10
		update_money(bulk_price_milk, add_or_sub)
	elif(ingredient == "ice"):
		var bulk_price_ice = price_ice * 10
		update_money(bulk_price_ice, add_or_sub)
	elif(ingredient =="cup"):
		var bulk_price_cup = price_cup * 10
		update_money(bulk_price_cup, add_or_sub)
		
func update_money(amount, add_or_sub):
	var curr_money = Global.curr_money
	if (add_or_sub == "add"):
		Global.curr_money = Global.curr_money - amount
	elif (add_or_sub =="sub"):
		Global.curr_money = Global.curr_money + amount
	
func update_inventory(ingredient, add_or_sub):
	if (ingredient == "mango"):
		if (add_or_sub == "add"):
			Global.inventory_mango = Global.inventory_mango + 10
		elif (add_or_sub == "sub"):
			Global.inventory_mango = Global.inventory_mango - 10
	elif(ingredient == "pineapple"):
		print("in pienapple")
		if (add_or_sub == "add"):
			Global.inventory_pineapple = Global.inventory_pineapple + 10
		elif (add_or_sub == "sub"):
			Global.inventory_pineapple = Global.inventory_pineapple - 10
	elif(ingredient == "dragonfruit"):
		if (add_or_sub == "add"):
			Global.inventory_dragonfruit = Global.inventory_dragonfruit + 10
		elif (add_or_sub == "sub"):
			Global.inventory_dragonfruit = Global.inventory_dragonfruit - 10
	elif(ingredient == "milk"):
		if (add_or_sub == "add"):
			Global.inventory_milk = Global.inventory_milk + 10
		elif (add_or_sub == "sub"):
			Global.inventory_milk = Global.inventory_milk - 10
	elif(ingredient == "ice"):
		if (add_or_sub == "add"):
			Global.inventory_ice = Global.inventory_ice + 10
		elif (add_or_sub == "sub"):
			Global.inventory_ice = Global.inventory_ice - 10
	elif(ingredient =="cup"):
		if (add_or_sub == "add"):
			Global.inventory_cup = Global.inventory_cup + 10
		elif (add_or_sub == "sub"):
			Global.inventory_cup = Global.inventory_cup - 10

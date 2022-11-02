extends Node

var total_days = 14
var req_amount_to_open_store = 0
var special_events = []

var curr_day
var curr_money
var curr_mango
var curr_pineapple
var curr_dragonfruit
var curr_milk
var curr_ice
var curr_cup

var inventory_mango
var inventory_pineapple
var inventory_dragonfruit
var inventory_milk
var inventory_ice
var inventory_cup

var total_income
var total_expenses

var price_mango = 0.50
var price_pineapple = 0.25
var price_dragonfruit = 0.75
var price_milk = 0.25
var price_ice = 0.25
var price_cup = 0.1

func _reset_values():
	curr_day = 0
	curr_money = 100.00
	curr_mango = 0
	curr_pineapple = 0
	curr_dragonfruit = 0
	curr_milk = 0
	curr_ice = 0
	curr_cup = 0
	total_income = 100
	total_expenses = 70
	special_events = []
	reset_inventory()

func reset_inventory():
	inventory_mango = 0
	inventory_pineapple = 0
	inventory_dragonfruit = 0
	inventory_milk = 0
	inventory_ice = 0
	inventory_cup = 0

# a list of special events to generate from
var _events = [
	{event ="King Kamehameha Floral Parade", population = 1}, 
	{event = "Prince Kuhio Festival", population =2}, 
	{event = "Long Weekend",population = 3},
	{event = "Ironman Triathlon", population = 4},
	{event = "Honolulu Marathon", population = 4},
	{event = "Rainy Day", population = 4},
	{event = "Brown Water Advisory", population = 4},
	{event = "Normal Day", population = 4}
]

var _ingredient_events = [
	{event = "Bad luck! The milk has spoiled. Make sure to restock!", id = 0},
	{event = "You got an overripe batch of mangoes! You can’t use rotten fruit. Restock.", id =1},
	{event = "Thieving birds! They made off with the dragon fruit! Order more.", id = 2}
]

#generate random events
func _ready():
	print("Global Called")

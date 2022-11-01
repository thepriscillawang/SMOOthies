extends Node

var total_days = 1
var curr_day = 0
var curr_money = 100.00
var req_amount_to_open_store = 0
var special_events = []

var curr_mango = 0
var curr_pineapple = 0
var curr_dragonfruit = 0
var curr_milk = 0
var curr_ice = 0
var curr_cup = 0

var total_income = 100
var total_expenses = 70
var net_profit = 0

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
	{event = "Oh, no! All of your ice has melted. You’ll need to buy more."},
	{event = "Bad luck! The milk has spoiled. Make sure to restock!"},
	{event = "You got an overripe batch of mangoes! You can’t use rotten fruit. Restock."},
	{event = "Thieving birds! They made off with the dragon fruit! Order more."}
]

#generate random events
func _ready():
	randomize()
	for i in range(14):
		special_events.append(get_events())
	print(typeof(special_events))

#generates list of events 
func get_events():
	var random_events = _events[randi() % _events.size()]
	return random_events

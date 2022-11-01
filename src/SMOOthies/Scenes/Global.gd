extends Node

var total_days = 3
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

var total_income
var total_expenses

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
	print("Global Called")

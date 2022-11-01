extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$TotalIncome.text = str(Global.total_income)
	$TotalExpense.text = str(Global.total_expenses)
	$NetProfit.text = str(Global.total_income - Global.total_expenses)

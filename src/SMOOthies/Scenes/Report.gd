extends Node2D

var net_profit = Global.total_income - Global.total_expenses

# Called when the node enters the scene tree for the first time.
func _ready():
	$TotalIncome.text = str(Global.total_income)
	$TotalExpense.text = str(Global.total_expenses)
	$NetProfit.text = str(net_profit)

func _on_ContinueButton_pressed():
	# if profit met, open congratulations scene
	if (net_profit < Global.req_amount_to_open_store):
		SceneLoader._change_scene("ReportTryAgain")
	else:
		SceneLoader._change_scene("ReportOpenStore")
		

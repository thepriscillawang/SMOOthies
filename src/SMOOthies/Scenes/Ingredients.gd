extends Node2D

func _ready():
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

extends Node2D

func _ready():
	print("hello")

func _load_Intro():
	var Main = SceneLoader._load_scene("Intro")
	Main.name = "Intro"

func _on_Order_pressed():
	_play_sound()

func _play_sound():
	$OrderIngredientsButtonSound.stream = load("res://Sounds/softbutton.wav")
	$OrderIngredientsButtonSound.connect("finished", self, "_load_ingredients_scene")
	$OrderIngredientsButtonSound.play()

func _load_ingredients_scene():
	SceneLoader._change_scene("Ingredients")


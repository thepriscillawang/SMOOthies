extends Node2D

func _ready():
	print("hello")

# Loads the intro scene.
func _load_intro():
	SceneLoader.main = self
	SceneLoader._load_scene("Intro")

func _on_StartButton_pressed():
	print("button pressed")
	_load_intro()

func _testfunction():
	print("test function called")
	print("this is Sandee")
	print("this is Hailey")

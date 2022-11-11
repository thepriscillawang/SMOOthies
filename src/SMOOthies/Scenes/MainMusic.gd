extends Node2D

func _ready():
	pass

func play_music():
	$WelcomeMusic.stream = load("res://Sounds/HawaiiDrum.wav")
	$WelcomeMusic.play()

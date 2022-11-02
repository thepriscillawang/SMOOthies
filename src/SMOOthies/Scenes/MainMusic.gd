extends Node2D

func _ready():
	pass
#	MusicController.play_music()
#	$WelcomeMusic.stream = load("res://sounds/HawaiiDrum.wav")
#	$WelcomeMusic.play()

func play_music():
	$WelcomeMusic.stream = load("res://sounds/HawaiiDrum.wav")
	$WelcomeMusic.play()

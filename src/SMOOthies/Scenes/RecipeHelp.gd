extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_CloseHelp_pressed():
	$CloseHelpOKButton.connect("finished", self, "_load_Recipe_scene")
	$CloseHelpOKButton.play()
	
func _load_Recipe_scene():
	SceneLoader._change_scene("Recipe")
	

extends Node

var current_scene
var main setget _set_main

func _set_main(_main):
	main = _main

#func _load_scene(scene):
#	if current_scene != null:
##		print(main)
	#	main.remove_child(current_scene)

#	c#urrent_scene = load("res://Scenes/" + scene + ".tscn").instance()
#	main.add_child(current_scene)
	
func _load_scene(scene):
	load("res://Scenes/" + scene + ".tscn").instance()

func _change_scene(scene):
	get_tree().change_scene("res://Scenes/" + scene + ".tscn") 

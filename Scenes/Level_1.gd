extends Node2D

var level_2 = "res://Scenes/Level_2.tscn"
var scene_transitioning = false

onready var timer = $Timer
onready var timer2 = $Timer2

func _ready():
	VisualServer.set_default_clear_color(Color.lightblue)
	timer2.start()
	

func change_scene():
	if Enemies.Count <= 0 and scene_transitioning == false:
		SceneTransition.scene_transition(level_2)
		scene_transitioning = true
		



func _on_Timer_timeout():
	change_scene()


func _on_Timer2_timeout():
	timer.start()

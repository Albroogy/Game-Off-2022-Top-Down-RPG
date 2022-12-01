extends Node2D

var dialog_1 
var scene_transitioning = false
var final_boss = "res://Scenes/OtherWorld_Scene.tscn"

var player: Node 
onready var animation_player = $CanvasLayer/AnimationPlayer

func _ready():
	Enemies.Count = 28
	player = get_tree().get_root().find_node('Player', true, false)
	player.cliche_on = false
	VisualServer.set_default_clear_color(Color.lightblue)
	get_tree().paused = true
	dialog_1 = Dialogic.start('dialogue-1')
	dialog_1.pause_mode = Node.PAUSE_MODE_PROCESS
	add_child(dialog_1)
	dialog_1.connect('timeline_end', self, 'change_timeline')

func _physics_process(delta):
	dialog_change()

func change_timeline(timeline_name):
	get_tree().paused = false
	var dialog_2 = Dialogic.start('dialogue-2')
	add_child(dialog_2)
	get_tree().paused = true
	dialog_2.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog_2.connect('timeline_end', self, 'unpause')

func unpause(timeline_name):
	get_tree().paused = false


func dialog_change():
	if Enemies.Count <= 0 and scene_transitioning == false:
		animation_player.play('dissolve')
		var dialogue_3 = Dialogic.start('dialogue-3')
		add_child(dialogue_3)
		get_tree().paused = true
		dialogue_3.pause_mode = Node.PAUSE_MODE_PROCESS
		dialogue_3.connect('timeline_end', self, 'unpause_2')
		scene_transitioning = true


func unpause_2(timeline_name):
	get_tree().paused = false
	SceneTransition.scene_transition(final_boss)

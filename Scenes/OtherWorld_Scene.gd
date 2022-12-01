extends Node2D


func _ready():
	var dialogue_4 = Dialogic.start('dialogue-4')
	add_child(dialogue_4)
	get_tree().paused = true
	dialogue_4.pause_mode = Node.PAUSE_MODE_PROCESS
	dialogue_4.connect('timeline_end', self, 'unpause')
	var player = get_tree().get_root().find_node('Player', true, false)
	player.cliche_on = false

# Called every frame. 'delta' is the elapsed time since the previous frame.

func unpause(timeline_name):
	get_tree().paused = false

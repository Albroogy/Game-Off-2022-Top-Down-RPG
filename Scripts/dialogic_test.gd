extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var dialogic = Dialogic.start('dialogue-3')
	add_child(dialogic)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

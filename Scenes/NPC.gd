extends Area2D

var health = 100
var level_1 = "res://Scenes/Level_1.tscn"

onready var health_bar = $Health/ProgressBar

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	health_bar.value = health
	if health <= 0:
		get_tree().reload_current_scene()

func _on_NPC_area_entered(area):
	if area.is_in_group('damage'):
		health -= area.damage

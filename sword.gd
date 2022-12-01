extends Node2D


onready var timer = $Timer
onready var attack_timer = $attack_delay
onready var hit_box = $CollisionShape2D

var previous_position = Vector2.ZERO
var damage = 20
var player: Node

func _ready():
	set_as_toplevel(true)

func _physics_process(delta):
	print(attack_timer.time_left)

func sword_animation():

	player = get_tree().get_root().find_node('Player', true, false)
	if is_instance_valid(player):
		previous_position = player.sword_position.global_position
		print('this is player')
	
	var tween = create_tween().set_trans(Tween.TRANS_QUINT)
	var new_position = global_position.direction_to(get_global_mouse_position()) * 100
	tween.tween_property(self, "position", new_position, 0.5)
	tween.tween_property(self, "position", previous_position, 0.5)
	print(previous_position)

		
func _process(delta):
	set_as_toplevel(false)
	look_at(get_global_mouse_position())


func _on_Timer_timeout():
	hit_box.disabled = true


func _on_attack_delay_timeout():
	pass

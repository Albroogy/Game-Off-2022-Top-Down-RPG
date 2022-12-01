extends CanvasLayer

func scene_transition(target: String, delay=0.5) -> void:
	yield(get_tree().create_timer(delay), "timeout")
	$AnimationPlayer.play("dissolve")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(target)
	$AnimationPlayer.play_backwards("dissolve")

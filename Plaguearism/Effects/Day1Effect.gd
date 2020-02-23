extends Node2D

export var active = false

func _physics_process(delta):
	if active:
		$AnimationPlayer.play("Flow")


func _on_AnimationPlayer_animation_finished(anim_name):
	active = false

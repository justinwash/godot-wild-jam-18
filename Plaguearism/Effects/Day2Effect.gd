extends Node2D

export var active = false

func _process(delta):
	if active:
		for child in get_children():
			child.active = true
		active = false

extends Node2D

var delay = 41

var t = 0

func _physics_process(delta):
	if t > delay*60:
		self.visible = true
	t += 1

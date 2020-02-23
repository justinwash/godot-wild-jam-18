extends KinematicBody2D

export var active = false
export var speed = 300
export var dir = Vector2(1,0)

var velocity
var target

var t = 1


func _ready():
	$AnimationPlayer.play("Bounce")
	
func _physics_process(delta):
	if active:
		self.visible = true
		move_and_slide(dir*speed)
		
		if t % 240 == 0:
			randomize()
			var posneg = -1 if randf() >= 0.5 else 1
			dir = Vector2(randf(), randf()) * posneg
			speed = 100
		
		t += 1

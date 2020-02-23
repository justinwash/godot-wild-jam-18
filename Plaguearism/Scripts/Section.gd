extends Label

export var active = false
export(float, 0.0, 60) var delay = 0
export(float, 0.1, 1.0) var slow = 0.5

export(NodePath) var challenge_path
onready var challenge = get_node(challenge_path)

var t = 0
	
func _physics_process(delta):
	if active && t >= delay*60:
		if (t % int((10*(slow*2))) == 0):
			self.visible_characters += 1
	
	if self.visible_characters >= len(self.text) && challenge != null:
		challenge.visible = true
		
	t += 1

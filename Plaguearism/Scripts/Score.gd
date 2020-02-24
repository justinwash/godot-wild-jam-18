extends Label

var correct = 0

func _physics_process(delta):
	self.text = "You got " + str(correct) + " out of 10 correct!"

extends Node2D

export var delay = 41
export var all_choices = [
	"struck the creek with his cane, turning once-clear water into Tang(tm) with too much of the powder stuff in it.",
	"summoned from the Creek of Tang(tm) a plague of Pogo Ball(tm)s, to annoy endlessly all the people of New Egypt",
	"Lice",
	"Wild animals/flies",
	"Every Schwinn and Gremlin in town falls apart",
	"Everyone gets super bad acne?",
	"Thunderstruck by AC/DC plays on repeat indefinitely (oh god no)",
	"Beatrix Potter emerges from all the copies of her books to devour carrots and other foodstuffs",
	"A Led Zeppelin large enough to blot out the sun",
	"Death of the first pet rock"
]
export(array, all_choices) var correct_choice
export var randomized_choices = [correct_choice]

var labels = { null, null, null }
var highlighted_label
var t = 0

func _ready():
	labels = { $1, $2, $3 }
	var all_choices_shuffled = all_choices
	all_choices_shuffled.shuffle()
	
	for(i, 0..10):
		if (all_choices_shuffled[i] != correct_choice && len(randomized_choices) < 3):
			randomized_choices.add(all_choices_shuffled[i])
	
	randomized_choices.shuffle()
	
	for (i, 0..3):
		labels.i.text = randomized_choices[i]
		
func _physics_process(delta):
	if t > delay*60:
		self.visible = true
	t += 1

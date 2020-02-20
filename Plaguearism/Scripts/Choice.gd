extends Node2D

export var delay = 41

onready var all_choices = [
	get_node("../AllChoices/Day1").editor_description,
	get_node("../AllChoices/Day2").editor_description,
	get_node("../AllChoices/Day3").editor_description,
	get_node("../AllChoices/Day4").editor_description,
	get_node("../AllChoices/Day5").editor_description,
	get_node("../AllChoices/Day6").editor_description,
	get_node("../AllChoices/Day7").editor_description,
	get_node("../AllChoices/Day8").editor_description,
	get_node("../AllChoices/Day9").editor_description,
	get_node("../AllChoices/Day10").editor_description,
]

export(NodePath) var correct_choice
onready var correct_choice_text = get_node(correct_choice).editor_description

onready var randomized_choices = [correct_choice_text]

var labels = []
var highlighted_label
var t = 0

func _ready():
	randomize()
	labels = [ $'1', $'2', $'3' ]
	var all_choices_shuffled = all_choices
	all_choices_shuffled.shuffle()
	
	for i in range(0, 10):
		if (all_choices_shuffled[i] != correct_choice_text && len(randomized_choices) < 3):
			randomized_choices.push_back(all_choices_shuffled[i])
	
	randomized_choices.shuffle()
	
	for j in range(0, 3):
		labels[j].text = randomized_choices[j]
		
func _physics_process(delta):
	if t > delay*60:
		self.visible = true
	t += 1

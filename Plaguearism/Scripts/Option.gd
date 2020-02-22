extends Label

onready var click_area = $ClickArea
onready var day = $".."
onready var selected = false
export(Color) var idle_color = get("custom_colors/font_color")
export(Color) var hover_color = Color('ff0000')
export(Color) var correct_color = Color('')
export(Color) var incorrect_color = Color('')

func _ready():
	click_area.connect("button_up", self, "_on_click")
	
func _physics_process(delta):
	if !selected:
		if (click_area.is_hovered()):
			add_color_override("font_color", hover_color)
		else:
			add_color_override("font_color", idle_color)

func _on_click():
	selected = true
	if (day.correct_choice_text == self.text):
		print("correct!")
		add_color_override("font_color", correct_color)
	else:
		print("wrong!")
		add_color_override("font_color", incorrect_color)

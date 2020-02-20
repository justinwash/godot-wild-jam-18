extends Label

onready var click_area = $ClickArea
onready var day = $".."
export(Color) var idle_color = get("custom_colors/font_color")
export(Color) var hover_color = Color('ff0000')

func _ready():
	click_area.connect("button_up", self, "_on_click")
	
func _physics_process(delta):
	if (click_area.is_hovered()):
		add_color_override("font_color", hover_color)
	else:
		add_color_override("font_color", idle_color)

func _on_click():
	if (day.correct_choice_text == self.text):
		print("correct!")
	else:
		print("wrong!")

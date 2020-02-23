extends Label

onready var click_area = $ClickArea
onready var day = $".."
onready var selected = false
export(Color) var idle_color = Color('0094ff')
export(Color) var hover_color = Color('0040ff')
export(Color) var correct_color = Color('00bd0c')
export(Color) var incorrect_color = Color('c40000')

func _ready():
	click_area.connect("button_up", self, "_on_click")
	
func _physics_process(delta):
	if !selected && !day.option_clicked:
		if (click_area.is_hovered()):
			add_color_override("font_color", hover_color)
		else:
			add_color_override("font_color", idle_color)

func _on_click():
	day.option_clicked = true
	selected = true
	if (day.correct_choice_text == self.text):
		print("correct!")
		add_color_override("font_color", correct_color)
		for child in get_parent().get_children():
			if child != self:
				child.free()
	else:
		if day.effect != null:
			day.effect.active = true
		print("wrong!")
		add_color_override("font_color", incorrect_color)
		for child in get_parent().get_children():
			if child != self:
				if child.text == day.correct_choice_text:
					child.add_color_override("font_color",correct_color)

				else:
					child.free()
				
	yield(get_tree().create_timer(1.0), "timeout")
	get_parent().next_day.active = true
	

extends Label

onready var click_area = $ClickArea
export(Color) var idle_color = Color('0094ff')
export(Color) var hover_color = Color('0040ff')

func _ready():
	click_area.connect("button_up", self, "_on_click")
	
func _physics_process(delta):
	if (click_area.is_hovered()):
		add_color_override("font_color", hover_color)
	else:
		add_color_override("font_color", idle_color)

func _on_click():
	get_tree().quit()
	

extends Label

onready var click_area = $ClickArea
onready var day = $".."
export(Color) var idle_color = get("custom_colors/font_color")
export(Color) var hover_color = Color('ff0000')

func _physics_process(delta):
	if (click_area.is_hovered()):
		add_color_override("font_color", hover_color)
	else:
		add_color_override("font_color", idle_color)

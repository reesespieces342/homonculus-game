extends Label

@onready var label = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.add_theme_font_size_override("font_size", 30)
	label.text = "Cells: %s" % [Globals.cell_count]

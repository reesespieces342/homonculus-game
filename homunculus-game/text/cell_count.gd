extends Label

@onready var cell_count = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cell_count.add_theme_font_size_override("font_size", 30)
	cell_count.text = "Cells: %.0f" % [Globals.cell_count]

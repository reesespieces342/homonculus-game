extends Label

@onready var computer_count = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	computer_count.add_theme_font_size_override("font_size", 30)
	computer_count.text = "%s" % [Globals.computer_count]

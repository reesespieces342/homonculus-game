extends Label

@onready var nano_count: Label = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	nano_count.add_theme_font_size_override("font_size", 30)
	nano_count.text = "%s" % [Globals.nano_count]

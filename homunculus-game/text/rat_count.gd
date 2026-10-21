extends Label

@onready var rat_count = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rat_count.add_theme_font_size_override("font_size", 30)
	rat_count.text = "%s" % [Globals.rat_count]

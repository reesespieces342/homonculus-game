extends Label

@onready var crispr_count = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	crispr_count.add_theme_font_size_override("font_size", 30)
	crispr_count.text = "%s" % [Globals.crispr_count]

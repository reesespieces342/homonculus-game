extends Label

@onready var sp_count: Label = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sp_count.add_theme_font_size_override("font_size", 30)
	sp_count.text = "%s" % [Globals.skill_points]

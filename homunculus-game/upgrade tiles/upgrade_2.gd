extends Area2D

# Upgrade 2 textures
const UNSELECTED = preload("uid://b1n4l64rbitfx")
const SELECTED = preload("uid://6nrev7gcml4y")

@onready var sprite = $Sprite2D

func _on_mouse_entered() -> void:
	sprite.texture = SELECTED
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)


func _on_mouse_exited() -> void:
	sprite.texture = UNSELECTED
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), .05)


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if Globals.cell_count >= 250:
				Globals.cell_count -= 250
				Globals.rat_count += 1
				Globals.cells_per_sec += Globals.cprat

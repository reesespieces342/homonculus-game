extends Area2D

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Globals.cell_count += 1
			print("+1 Cell! Cell count: ", Globals.cell_count)

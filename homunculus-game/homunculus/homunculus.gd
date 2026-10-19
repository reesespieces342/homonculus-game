extends Area2D

const PARTICLES = preload("uid://ddhu3fxfua2lh")

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# Makes sprite grow and shrink
			var tween = create_tween()
			tween.tween_property(self, "scale", Vector2(1.1, 1.1), .05)
			tween.tween_property(self, "scale", Vector2(1, 1,), .05)
			
			Globals.cell_count += 1
			
			# Handles particles on click
			var particles = PARTICLES.instantiate() as CPUParticles2D
			particles.global_position = get_global_mouse_position()
			get_tree().current_scene.add_child(particles)
			particles.emitting = true

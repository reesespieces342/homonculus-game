extends Area2D

const PARTICLES = preload("uid://ddhu3fxfua2lh")
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var click : AudioStreamPlayer = $"../Click"

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# Makes sprite grow and shrink
			var tween = create_tween()
			tween.tween_property(self, "scale", Vector2(1.1, 1.1), .05)
			tween.tween_property(self, "scale", Vector2(1, 1,), .05)
			
			Globals.cell_count += Globals.cells_per_click
			
			click.play()
			
			# Handles particles on click
			var particles = PARTICLES.instantiate() as CPUParticles2D
			particles.global_position = get_global_mouse_position()
			get_tree().current_scene.add_child(particles)
			particles.emitting = true


func _on_skill_21_legs() -> void:
	if Globals.skill2_1 and Globals.skill2_2:
		sprite.play("armslegs")
	else:
		sprite.play("legs")


func _on_skill_22_arms() -> void:
	if Globals.skill2_1 and Globals.skill2_2:
		sprite.play("armslegs")
	else:
		sprite.play("arms")


func _on_skill_23_head() -> void:
	sprite.play("head")


func _on_skill_31_suit() -> void:
	if not Globals.skill3_1 and not Globals.skill3_2:
		sprite.play("head")
	elif Globals.skill3_1 and not Globals.skill3_2:
		sprite.play("suit")
	elif not Globals.skill3_1 and Globals.skill3_2:
		sprite.play("cat")
	elif Globals.skill3_1 and Globals.skill3_2:
		sprite.play("catsuit")


func _on_skill_32_cat() -> void:
	if not Globals.skill3_2 and not Globals.skill3_1:
		sprite.play("head")
	elif Globals.skill3_2 and not Globals.skill3_1:
		sprite.play("cat")
	elif not Globals.skill3_2 and Globals.skill3_1:
		sprite.play("suit")
	elif Globals.skill3_2 and Globals.skill3_1:
		sprite.play("catsuit")

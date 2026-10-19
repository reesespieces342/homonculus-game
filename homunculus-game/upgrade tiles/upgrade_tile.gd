extends Area2D

# Blank textures
const UNSELECTED = preload("uid://fv1vltsiqskq")
const SELECTED = preload("uid://cvfpjcwh1b3y")

@onready var sprite = $Sprite2D

func _on_mouse_entered() -> void:
	sprite.texture = SELECTED
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)


func _on_mouse_exited() -> void:
	sprite.texture = UNSELECTED
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), .05)

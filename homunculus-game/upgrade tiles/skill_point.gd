extends Area2D

const UNSELECTED = preload("uid://bboe1i62g8f4b")
const SELECTED = preload("uid://b0mxu7k3jlq7q")

@onready var sprite : Sprite2D = $Sprite2D
@onready var label : Label = $Label

func _ready() -> void:
	label.hide()


func _process(delta: float) -> void:
	label.text = "Cells Required: %s" % [Globals.cells_req]
	if label.visible:
		var pos = get_global_mouse_position()
		label.global_position = Vector2(pos.x, pos.y - 25)

func _on_mouse_entered() -> void:
	sprite.texture = SELECTED
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(.9, .9), .05)
	label.show()

func _on_mouse_exited() -> void:
	sprite.texture = UNSELECTED
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(.8, .8), .05)
	label.hide()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if Globals.cell_count >= Globals.cells_req:
				Globals.skill_points += 1
				Globals.cell_count -= Globals.cells_req
				Globals.cells_req *= 1.5

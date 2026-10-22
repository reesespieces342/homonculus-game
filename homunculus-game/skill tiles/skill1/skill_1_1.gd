extends Area2D

const UNSELECTED = preload("uid://o7ql3hfat8tv")
const SELECTED = preload("uid://y5umshuoqa8u")

var sp_req : int = 2

@onready var sprite = $Sprite2D
@onready var label: Label = $Label

func _ready() -> void:
	label.hide()


func _process(delta: float) -> void:
	label.text = "%s SP\nClick x2" % [sp_req]
	if label.visible:
		var pos = get_global_mouse_position()
		label.global_position = Vector2(pos.x + 15, pos.y - 25)


func _on_mouse_entered() -> void:
	sprite.texture = SELECTED
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)
	label.show()


func _on_mouse_exited() -> void:
	if not Globals.skill1_1:
		sprite.texture = UNSELECTED
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(1, 1), .05)
	label.hide()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if Globals.skill1 and not Globals.skill1_1:
				if Globals.skill_points >= sp_req:
					Globals.cells_per_click *= 2
					Globals.skill_points -= sp_req
					
					Globals.skill1_1 = true
					
					sprite.texture = SELECTED
					var tween = create_tween()
					tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)

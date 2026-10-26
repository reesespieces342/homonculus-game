extends Area2D

const UNSELECTED = preload("uid://coi7xok0v4qqe")
const SELECTED = preload("uid://b8p0iteryjpt0")

var sp_req : int = 1

@onready var sprite = $Sprite2D
@onready var label: Label = $Label

func _ready() -> void:
	label.hide()


func _process(delta: float) -> void:
	label.text = "%s SP\nUnlock Branch\nReq. Fear Response & Heart" % [sp_req]
	if label.visible:
		var pos = get_global_mouse_position()
		label.global_position = Vector2(pos.x + 15, pos.y - 25)


func _on_mouse_entered() -> void:
	sprite.texture = SELECTED
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)
	label.show()


func _on_mouse_exited() -> void:
	if not Globals.skill3:
		sprite.texture = UNSELECTED
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(1, 1), .05)
	label.hide()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if Globals.skill1_2 and Globals.skill2_4:
				if Globals.skill_points >= sp_req:
					Globals.skill3 = true
					Globals.skill_points -= sp_req
					
					sprite.texture = SELECTED
					var tween = create_tween()
					tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)

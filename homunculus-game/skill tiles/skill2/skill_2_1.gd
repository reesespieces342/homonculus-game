extends Area2D

const UNSELECTED = preload("uid://bsrtv2p4o22pg")
const SELECTED = preload("uid://lg0l6sntm6by")

signal legs

var sp_req : int = 2

@onready var sprite = $Sprite2D
@onready var label: Label = $Label

func _ready() -> void:
	label.hide()


func _process(delta: float) -> void:
	label.text = "%s SP\nNano x 1.5" % [sp_req]
	if label.visible:
		var pos = get_global_mouse_position()
		label.global_position = Vector2(pos.x + 15, pos.y - 25)


func _on_mouse_entered() -> void:
	sprite.texture = SELECTED
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)
	label.show()


func _on_mouse_exited() -> void:
	if not Globals.skill2_1:
		sprite.texture = UNSELECTED
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(1, 1), .05)
	label.hide()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if Globals.skill2 and not Globals.skill2_1:
				if Globals.skill_points >= sp_req:
					Globals.cpnano *= 1.5
					Globals.skill_points -= sp_req
					
					Globals.skill2_1 = true
					legs.emit()
					
					sprite.texture = SELECTED
					var tween = create_tween()
					tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)

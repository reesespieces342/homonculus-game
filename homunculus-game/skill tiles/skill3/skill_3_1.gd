extends Area2D

const UNSELECTED = preload("uid://dcchhiw3rowbt")
const SELECTED = preload("uid://ddbeadwdeo4mg")

var sp_req : int = 2
var bought : bool = false

@onready var sprite = $Sprite2D
@onready var label: Label = $Label

signal suit

func _ready() -> void:
	label.hide()


func _process(delta: float) -> void:
	label.text = "%s SP\nSuit" % [sp_req]
	if label.visible:
		var pos = get_global_mouse_position()
		label.global_position = Vector2(pos.x + 15, pos.y - 25)


func _on_mouse_entered() -> void:
	sprite.texture = SELECTED
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)
	label.show()


func _on_mouse_exited() -> void:
	if not Globals.skill3_1:
		sprite.texture = UNSELECTED
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(1, 1), .05)
	label.hide()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if Globals.skill3:
				if not bought:
					if Globals.skill_points >= sp_req:
						Globals.skill3_1 = true
						bought = true
						
						Globals.skill_points -= sp_req
						
						sprite.texture = SELECTED
						var tween = create_tween()
						tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)
				else:
					if Globals.skill3_1:
						Globals.skill3_1 = false
					else:
						Globals.skill3_1 = true
						
				suit.emit()

extends Area2D

const UNSELECTED = preload("uid://7fs2j4tx54qy")
const SELECTED = preload("uid://dalttvhnkajw4")

var sp_req : int = 2

signal arms

@onready var sprite = $Sprite2D
@onready var label: Label = $Label

func _ready() -> void:
	label.hide()


func _process(delta: float) -> void:
	label.text = "%s SP\nRats x 1.5" % [sp_req]
	if label.visible:
		var pos = get_global_mouse_position()
		label.global_position = Vector2(pos.x + 15, pos.y - 25)


func _on_mouse_entered() -> void:
	sprite.texture = SELECTED
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)
	label.show()


func _on_mouse_exited() -> void:
	if not Globals.skill2_2:
		sprite.texture = UNSELECTED
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(1, 1), .05)
	label.hide()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if Globals.skill2 and not Globals.skill2_2:
				if Globals.skill_points >= sp_req:
					Globals.cprat *= 1.5
					Globals.skill_points -= sp_req
						
					Globals.skill2_2 = true
					arms.emit()
					
					sprite.texture = SELECTED
					var tween = create_tween()
					tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)

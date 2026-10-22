extends Area2D

const UNSELECTED = preload("uid://dxyba6r38d3hk")
const SELECTED = preload("uid://dt4rjswfqkqh5")

var sp_req : int = 3

@onready var sprite = $Sprite2D
@onready var label: Label = $Label

signal cat

func _ready() -> void:
	label.hide()


func _process(delta: float) -> void:
	label.text = "%s SP\nTake a wild guess" % [sp_req]
	if label.visible:
		var pos = get_global_mouse_position()
		label.global_position = Vector2(pos.x + 15, pos.y - 25)


func _on_mouse_entered() -> void:
	sprite.texture = SELECTED
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)
	label.show()


func _on_mouse_exited() -> void:
	if not Globals.skill3_2:
		sprite.texture = UNSELECTED
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2(1, 1), .05)
	label.hide()


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if Globals.skill3_1:
				if Globals.skill_points >= sp_req:
					if not Globals.skill3_2:
						Globals.skill3_2 = true
					else:
						Globals.skill3_2 = false
					
					cat.emit()
					Globals.skill_points -= sp_req
					
					sprite.texture = SELECTED
					var tween = create_tween()
					tween.tween_property(self, "scale", Vector2(1.05, 1.05), .05)

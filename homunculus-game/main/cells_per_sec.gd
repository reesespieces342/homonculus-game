extends Node2D


func _on_timer_timeout() -> void:
	Globals.cell_count += (Globals.cells_per_sec / 10)

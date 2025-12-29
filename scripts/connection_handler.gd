class_name CollectionHandler
extends Area2D

func _ready() -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	if area == null:
		return
	if area is Fudge:
		area.emit_signal("collect_fudge")

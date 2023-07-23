class_name Cross
extends Node2D


var is_disabled: bool = false


func toggle() -> bool:
	if is_disabled:
		return false
	
	visible = not visible
	return visible

func disable() -> void:
	is_disabled = true
	visible = false


func enable() -> void:
	is_disabled = false

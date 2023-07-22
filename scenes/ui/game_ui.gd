class_name GameUI
extends CanvasLayer


const FLASHLIGHT: Texture = preload("res://assets/others/flashlight.png")

@export var item_slot: TextureRect


func change_item(item: Texture) -> void:
	item_slot.texture = item


func remove_item() -> void:
	item_slot.texture = null

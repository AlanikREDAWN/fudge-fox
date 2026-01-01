class_name HotkeyRebindButton
extends Control

@onready var label: Label = $HBoxContainer/Label
@onready var button: Button = $HBoxContainer/Button

@export var action_name: String = "left"

func _ready() -> void:
	set_process_unhandled_key_input(false)
	set_action_name()


func set_action_name() -> void:
	label.text = "Unassigned"
	
	match action_name:
		"left":
			label.text = "Move Left"
		"right":
			label.text = "Move right"
		"jump":
			label.text = "Jump"
		"up":
			label.text = "Climb up"
		"down":
			label.text = "Climb down"

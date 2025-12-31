class_name OptionsMenu
extends Control

@onready var exit_button: TextureButton = $MarginContainer/Exit_Button

signal exit_options_menu

func _ready() -> void:
	set_process(false)

func _on_exit_button_pressed() -> void:
	exit_options_menu.emit()
	set_process(false)

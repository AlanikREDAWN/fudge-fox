class_name MainMenu
extends Control

@onready var start_button: TextureButton = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button
@onready var exit_button: TextureButton = $MarginContainer/Exit_Button

@onready var options_menu: OptionsMenu = $Options_Menu
@onready var margin_container: MarginContainer = $MarginContainer



@export var start_level = preload("res://scenes/instructions.tscn")

func _on_start_button_pressed() -> void:
	#get_tree().change_scene_to_packed(start_level)
	get_tree().change_scene_to_file("res://scenes/cutscene_1.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_settings_button_pressed() -> void:
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true
	


func _on_exit_options_menu() -> void:
	margin_container.visible = true
	options_menu.visible = false

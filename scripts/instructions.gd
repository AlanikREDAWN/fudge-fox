extends Control

@onready var text_animation_player: AnimationPlayer = $TextAnimationPlayer
@onready var fudge_animation_player: AnimationPlayer = $FudgeAnimationPlayer

@export var back_button = preload("res://scenes/main_menu.tscn")
@export var forward_button = preload("res://scenes/cutscene_1.tscn")

func _ready() -> void:
	text_animation_player.play("typing_text")
	fudge_animation_player.play("fudgeSpin")


func _on_back_button_pressed() -> void:
	#get_tree().change_scene_to_packed(back_button)
	get_tree().change_scene_to_file("res://scenes/cutscene_1.tscn")

func _on_forward_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_select.tscn")
	#get_tree().change_scene_to_packed(forward_button)
	#get_tree().change_scene_to_file("res://scenes/cutscene_1.tscn")

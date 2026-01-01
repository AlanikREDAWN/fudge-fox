extends Control

@onready var text_animation_player: AnimationPlayer = $TextAnimationPlayer
@onready var fudge_animation_player: AnimationPlayer = $FudgeAnimationPlayer
@onready var fox_animation_player: AnimationPlayer = $FoxAnimationPlayer

func _ready() -> void:
	text_animation_player.play("typing_text")
	fudge_animation_player.play("fudgeSpin")
	fox_animation_player.play("foxWalk")


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_forward_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")

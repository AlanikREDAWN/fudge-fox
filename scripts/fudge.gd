class_name Fudge
extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

#@export var fudge_resource: BaseCollectableResource = null

signal collect_fudge

func _ready() -> void:
	#sprite_2d.texture = fudge_resource.collectable_texture
	#sprite_2d.scale = fudge_resource.collectable_texture_scale
	pass

func _on_collect_fudge() -> void:
	print("collected")
	Global.collect_fudge()
	#Global.fudge_amount += 1
	queue_free()

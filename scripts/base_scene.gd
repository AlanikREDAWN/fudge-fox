class_name BaseScene extends Node

@onready var player: Player = $Player

#@onready var PlayerScene: PackedScene = preload("res://scenes/fox.tscn")
#var player: CharacterBody2D
#@onready var player = preload("res://scenes/fox.tscn")
@onready var entrance_markers: Node2D = $EntranceMarkers

func _ready() -> void:
	Global.base_scene = self
	if scene_manager.player:
		if player:
			player.queue_free()
			
		var old_player = get_node_or_null("Player")
		if old_player:
			old_player.free()
		player = scene_manager.player
		add_child(player)
		player.name = "Player"
		#player.set_as_top_level(false)
		#player.global_position = player.global_position
	#else:
		#player = PlayerScene.instantiate()
		#scene_manager.player = player
	position_player()

func position_player() -> void:
	var last_scene = scene_manager.last_scene_name
	if last_scene.is_empty():
		last_scene = "any"
	
	for entrance in entrance_markers.get_children():
		
		if entrance is Marker2D and entrance.name == "any" or entrance.name == last_scene:
			#print("WORKING")
			player.global_position = entrance.global_position

func respawn():
	for entrance in entrance_markers.get_children():
		if entrance is Marker2D and entrance.name == "any":
			#print("WORKING")
			player.global_position = entrance.global_position

class_name SceneTrigger extends Area2D

@export var connected_scene: String # scene to change to
@export var trigger_id: String = ""
var enabled: bool = true

func _ready():
	if trigger_id != "":
		if is_instance_valid(Global):
			Global.register_trigger(trigger_id, self)
			print("Registered trigger:", trigger_id)
		#Global.register_trigger(trigger_id, self)
		
		#print("trigger registered")

func set_enabled(state: bool) -> void:
	enabled = state
	monitoring = state
	monitorable = state

func _on_body_entered(body: Node2D) -> void:
	if not enabled:
		return
	if body.is_in_group("player") and Global.enough_fudge == true:
		scene_manager.change_scene(get_owner(), connected_scene)

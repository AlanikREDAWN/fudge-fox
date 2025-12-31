extends Node

var base_scene = null

var fudge_amount = 0
var fudge_needed = 0
var enough_fudge = false
var fudge_label = null

var triggers: Dictionary = {}
var level1_completed = false

var bg_music = null

var win = false

var win_music = null


func register_trigger(id: String, trigger: Area2D) -> void:
	triggers[id] = trigger
	print("Global now has triggers:", triggers.keys())


func set_trigger_enabled(id: String, enabled: bool = true) -> void:
	if triggers.has(id) and is_instance_valid(triggers[id]):
		triggers[id].set_enabled(enabled)

#func set_trigger_enabled(id: String, enabled: bool = true) -> void:
	##if triggers.has(id):
		##triggers[id].monitoring = not enabled
		##triggers[id].monitorable = not enabled
	#if triggers.has(id) and is_instance_valid(triggers[id]):
		#var t = triggers[id] as SceneTrigger
		#t.monitoring = enabled
		#t.monitorable = enabled
		#t.disconnect("body_entered", t.get_script(), "_on_body_entered")


func collect_fudge():
	fudge_amount += 1
	if fudge_label:
		fudge_label.text = "Fudge: " + str(fudge_amount) + " / " + str(fudge_needed)
	else:
		print("no label to change")


	
	
func _process(delta: float) -> void:
	if fudge_amount >= fudge_needed:
		enough_fudge = true
		#print("enough fudge")
	else: 
		enough_fudge = false
		#print("not enough fudge")
		
	if level1_completed == true:
		set_trigger_enabled("level_1", false)
	
	if win == true:
		bg_music.playing = false
		#await get_tree().create_timer(1.0, true).timeout
		#win_music.playing = true

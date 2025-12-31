extends BaseScene

func _ready() -> void:
	super()
	Global.fudge_needed = 10
	if Global.fudge_label:
		Global.fudge_label.text = "Fudge: " + str(Global.fudge_amount) + " / " + str(Global.fudge_needed)

extends BaseScene

func _ready() -> void:
	super()
	if Global.fudge_label:
		Global.fudge_label.text = "Fudge: " + str(Global.fudge_amount) + " / " + str(Global.fudge_needed)

extends BaseScene
@onready var win_music: AudioStreamPlayer = $win_music

func _ready() -> void:
	super()
	if Global.fudge_label:
		Global.fudge_label.text = "Fudge: " + str(Global.fudge_amount) + " / " + str(Global.fudge_needed)
	win_music.play()

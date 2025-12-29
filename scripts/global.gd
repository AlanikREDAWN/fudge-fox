extends Node

var base_scene = null

var fudge_amount = 0
var fudge_label = null

func collect_fudge():
	fudge_amount += 1
	if fudge_label:
		fudge_label.text = "Fudge: " + str(fudge_amount)
	else:
		print("no label to change")

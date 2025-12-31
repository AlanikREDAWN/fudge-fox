extends StaticBody2D

var door_open: bool

@onready var door_sprite: AnimatedSprite2D = $doorSprite


func _on_activate_door_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if Global.enough_fudge == true:
			if !door_open:
				door_sprite.play("open")
				door_open = true
			#door_collision_shape.set_deferred("disabled", true)

func _on_activate_door_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		if door_open:
			door_sprite.play("close")
			door_open = false

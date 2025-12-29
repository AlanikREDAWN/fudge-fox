class_name Player extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -250.0
const CLIMB_SPEED = 100.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var air_jumps = 1
var current_air_jumps = 0

var coyote_timer = 0.0
const COYOTE_TIME_THRESHOLD = 0.1

var jump_buffer_timer = 0.0
const JUMP_BUFFER_TIME_THRESHOLD = 0.1

var on_ladder: bool

func respawn():
	Global.base_scene.respawn()

func _physics_process(delta: float) -> void:
	# climbing
	if on_ladder == true:
		#pass
		#print("fox is sitting")
		#if $Fox:
				#$Fox.play("sitting")
		var climbing_direction = Input.get_axis("up", "down")
		#velocity.y = climbing_direction * CLIMB_SPEED
		#velocity.x = 0
		if climbing_direction:
			print(climbing_direction)
			#velocity.y = climbing_direction * CLIMB_SPEED
			velocity.y = move_toward(velocity.y, climbing_direction * CLIMB_SPEED, CLIMB_SPEED * 5.0 * delta)
			#velocity.x = 0
		else:
			#pass
			velocity.y = move_toward(velocity.y, 0, CLIMB_SPEED * 5.0 * delta)
	
	# gravity
	if not is_on_floor() and not on_ladder:
		velocity.y += gravity * delta
	else:
		current_air_jumps = air_jumps
		coyote_timer = COYOTE_TIME_THRESHOLD
	
	if coyote_timer > 0:
		coyote_timer -= delta
	if jump_buffer_timer > 0:
		jump_buffer_timer -= delta
	
	if Input.is_action_just_pressed("jump"):
		jump_buffer_timer = JUMP_BUFFER_TIME_THRESHOLD
	
	if jump_buffer_timer > 0:
		if is_on_floor() or coyote_timer > 0:
			velocity.y = JUMP_VELOCITY
			jump_buffer_timer = 0
			coyote_timer = 0
		elif current_air_jumps > 0:
			velocity.y = JUMP_VELOCITY * 0.8
			current_air_jumps -= 1
			jump_buffer_timer = 0
	
	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, SPEED * 5.0 * delta)
		if $Fox:
			$Fox.flip_h = (direction < 0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * 5.0 * delta)
	
	move_and_slide()
	
	update_animations()
	
func update_animations():
	if not $Fox: return
	
	if not is_on_floor():
		if on_ladder:
			$Fox.play("sitting")
		elif velocity.y < 0:
			$Fox.play("jump")
		else:
			$Fox.play("idle")
	
	else:
		if on_ladder:
			$Fox.play("sitting")
		elif abs(velocity.x) > 5:
			$Fox.play("walk")
		else:
			$Fox.play("idle")



# OLD MOVEMENT SYSTEM
#@export var speed = 100
#@export var gravity = 200
#@export var jump_height = -100
#
## states of movement 
#var is_attacking = false
#var is_climbing = false
#
## movement
#func _physics_process(delta: float) -> void:
	#velocity.y += gravity * delta
	#
	#horizontal_movement()
	#
	#move_and_slide()
	#
	#if !is_attacking:
		#player_animations()
#
#func horizontal_movement():
	#var horizontal_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	#
	#velocity.x = horizontal_input * speed
	#
## animations
#func player_animations():
	#if Input.is_action_pressed("left") || Input.is_action_just_released("jump"):
		#$Fox.flip_h = true
		#$Fox.play("walk")
	#
	#if Input.is_action_pressed("right") || Input.is_action_just_released("jump"):
		#$Fox.flip_h = false
		#$Fox.play("walk")
	#
	#if !Input.is_anything_pressed():
		#$Fox.play("idle")
#
#func _input(event: InputEvent) -> void:
	## attack
	#if event.is_action_pressed("attack"):
		#is_attacking = true
		#$Fox.play("attack")
		#
	## jump
	#if event.is_action_pressed("jump") and is_on_floor():
		#velocity.y = jump_height
		#$Fox.play("jump")
	#
	## climbing
	#if is_climbing == true:
		#if Input.is_action_pressed("up"):
			#$Fox.play("sitting")
			#gravity = 100
			#velocity.y = -200
	#
	## reset after climbing
	#else:
		#gravity = 200
		#is_climbing = false
#
#
#func _on_fox_animation_finished() -> void:
	#is_attacking = false


func _on_ladder_checker_body_entered(body: Node2D) -> void:
	on_ladder = true
	print("on ladder")


func _on_ladder_checker_body_exited(body: Node2D) -> void:
	on_ladder = false
	#$Fox.play("idle")
	print("not on ladder")

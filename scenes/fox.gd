extends CharacterBody2D

@export var speed = 100
@export var gravity = 200
@export var jump_height = -100

# states of movement 
var is_attacking = false
var is_climbing = false

# movement
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	horizontal_movement()
	
	#move_and_slide()
	
	if !is_attacking:
		player_animations()

func horizontal_movement():
	var horizontal_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	velocity.x = horizontal_input * speed
	
# animations
func player_animations():
	if Input.is_action_pressed("left") || Input.is_action_just_released("jump"):
		$Fox.flip_h = true
		$Fox.play("walk")
	
	if Input.is_action_pressed("right") || Input.is_action_just_released("jump"):
		$Fox.flip_h = false
		$Fox.play("walk")
	
	if !Input.is_anything_pressed():
		$Fox.play("idle")

func _input(event: InputEvent) -> void:
	# attack
	if event.is_action_pressed("attack"):
		is_attacking = true
		$Fox.play("attack")
		
	# jump
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_height
		$Fox.play("jump")
	
	# climbing
	if is_climbing == true:
		if Input.is_action_pressed("up"):
			$Fox.play("sitting")
			gravity = 100
			velocity.y = -200
	
	# reset after climbing
	else:
		gravity = 200
		is_climbing = false


func _on_fox_animation_finished() -> void:
	is_attacking = false

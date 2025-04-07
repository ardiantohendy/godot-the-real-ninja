extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 400.0
var JUMP_VELOCITY = -1250.0

#double jump var
const MAX_JUMPS = 2
var jump_left = MAX_JUMPS
var has_jumped = false

#jump when killing enemy
func jump():
	velocity.y = JUMP_VELOCITY + 200

#animation get hit
func get_hit(x):
	velocity.y = JUMP_VELOCITY + 200
	velocity.x = x

func _physics_process(delta: float) -> void:
	
	#double jump code
	if is_on_floor():
		jump_left = MAX_JUMPS
		has_jumped = false
		
	if Input.is_action_just_pressed("jump") and jump_left > 0:
		velocity.y = JUMP_VELOCITY
		jump_left -= 1
		JUMP_VELOCITY = -1250.0
		
		if not has_jumped:
			has_jumped = true
		
	if not is_on_floor() and not has_jumped:
		jump_left = 1
		JUMP_VELOCITY = -1250.0
		
	velocity += get_gravity() * delta
		
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	elif not is_on_floor() and jump_left == 0:
		animated_sprite_2d.play("double_jump")
	else:
		animated_sprite_2d.play("jump")
		
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 40)
		
		
	move_and_slide()
	
	

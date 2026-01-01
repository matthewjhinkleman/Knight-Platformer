extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
var can_move = true

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func die():
	can_move = false
	animated_sprite.play("hit")
	Music.stop_music()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if Input.is_action_just_pressed("toTitleScreen"):
		get_tree().change_scene_to_file("res://scenes/titleScreen.tscn")
		GameManager.reset()
	

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Gets input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flips the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if animated_sprite.animation == "hit":
		pass
	elif is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# Applys movement
	if can_move:
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


extends CharacterBody2D

@export var speed : int = 450
@export var gravity : int = 800
@export var jump_speed : int = 500

func _physics_process(delta: float) -> void:
	#this  is gravity
	velocity.y += gravity * delta
	#this is where it moves back and forth
	velocity.x = Input.get_axis("walk_left", "walk_right") * speed
	
	if abs(velocity.y) > 100:
		$CharecterAnimation.play("jump")
	elif  abs(velocity.x) > 0:
		$CharecterAnimation.play("walk")
	else:
		$CharecterAnimation.play("idle")
		
	#this is where we jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= 550
	move_and_slide()

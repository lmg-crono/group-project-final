
extends CharacterBody2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

@export var speed : int = 450
@export var gravity : int = 800
@export var jump_speed : int = 500
var kickbox_offset 
func _ready():
	kickbox_offset = collision_shape_2d.position.x
func _physics_process(delta: float) -> void:
	#this  is gravity
	velocity.y += gravity * delta
	#this is where it moves back and forth
	velocity.x = Input.get_axis("walk_left", "walk_right") * speed
	
	if not $KickTimer.is_stopped():
		$CharacterAnimation.play("kicking")
	
	elif abs(velocity.y) > 100:
		$CharacterAnimation.play("jump")
	elif  (velocity.x) != 0:
		$CharacterAnimation.play("walking-right")
		
	#elif (velocity.x) < 0:
		#$CharacterAnimation.play("walking-left ")
		
	else:
		$CharacterAnimation.play("idle")
		
	#this is where we jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= 550
	if Input.is_action_just_pressed("Kick"):
		$KickTimer.start()
		$CharacterAnimation.play("kicking")
		if $CharacterAnimation.flip_h:
			collision_shape_2d.position.x = -kickbox_offset
		else: 
			collision_shape_2d.position.x = kickbox_offset
		collision_shape_2d.set_deferred("disabled",false)
	move_and_slide()
	if velocity.x > 0:
		$CharacterAnimation.flip_h = false
	elif velocity.x < 0:
		$CharacterAnimation.flip_h = true

	if  Input.is_action_just_pressed("Quit"):
		get_tree().quit()

func _on_kick_timer_timeout() -> void:
	collision_shape_2d.set_deferred("disabled",true)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"): 
		body.queue_free()

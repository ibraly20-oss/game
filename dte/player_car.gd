extends CharacterBody2D

@export var engine_force : float = 300.0	
@export var brake_force : float = 750.0
@export var friction : float = 60.0
@export var steer_speed : float = 150.0
@export var max_speed : float = 950.0
@export var drifting : float = 500.0

var speed : float = 0.0

func _physics_process(delta: float) -> void:
	var throttle = Input.get_axis("brake","acceleration")
	var steer = Input.get_axis("steer_left", "steer_right")
	
	apply_throttle(throttle,delta)
	apply_steering(steer,delta)
	
	velocity = Vector2.LEFT.rotated(rotation) * speed
	move_and_slide()

func apply_throttle(throttle, delta):
	if throttle > 0.0:
		speed += engine_force * throttle * delta
	elif throttle < 0.0:
		speed -= brake_force * abs(throttle) * delta 
	else:
		speed
		speed = move_toward(speed,0.0,friction * delta)
	speed=clamp(speed,-max_speed * 0.3,max_speed)
	
func apply_steering(steer, delta):
	if abs(speed) < 10.0:
		return
	rotation_degrees += steer * steer_speed * delta

	
		
	
	

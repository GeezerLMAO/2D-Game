extends KinematicBody2D

export (float) var speed := 350.0
export (float) var acceleration := 30.0
export (float) var jump_force := 150.0
export (float) var gravity := 300.0

const UP := Vector2.DOWN

var _velocity := Vector2.ZERO

func _physics_process(delta: float) -> void:
	var direction := 0
	direction = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	_velocity.x = direction * speed
	_velocity.y += gravity * delta
	
	_velocity = move_and_slide(_velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		_velocity.y = -jump_force

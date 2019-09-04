extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const ACCELERATION = 2
const MASS = 10
const FRICTION = 0.95
const MAX_ROTATION = PI / 20

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	# apply input inertia
	var inertia = ACCELERATION * MASS
	if Input.is_action_pressed("ui_right"):
		velocity.x += inertia
	elif Input.is_action_pressed("ui_left"):
		velocity.x += -inertia
	
	if Input.is_action_pressed("ui_up"):
		velocity.y += -inertia
	elif Input.is_action_pressed("ui_down"):
		velocity.y += inertia
		
	# slow things down a little
	velocity.x *= FRICTION
	velocity.y *= FRICTION
	
	# face the direction player indicates
	var new_rotation = Vector2()

	if Input.is_action_pressed("rot_right"):
		new_rotation.x = 1
	elif Input.is_action_pressed("rot_left"):
		new_rotation.x = -1

	if Input.is_action_pressed("rot_up"):
		new_rotation.y = -1
	elif Input.is_action_pressed("rot_down"):
		new_rotation.y = 1

	if new_rotation:
		new_rotation = new_rotation.angle()
		if abs(rotation - new_rotation) > MAX_ROTATION:
			new_rotation = rotation + MAX_ROTATION
		rotation = new_rotation
	
	# apply force
	move_and_slide(velocity)

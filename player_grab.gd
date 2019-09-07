extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var grabbed = null
var grabbable = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func reparent(body):
	body.get_parent().remove_child(body)
	$grab.add_child(body)
	
func grab_body(body):
	(body as RigidBody2D).mode = RigidBody2D.MODE_KINEMATIC
	grabbed = body
	call_deferred("reparent", body)
	print("Grabbed " + (body as RigidBody2D).name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		if grabbable and not grabbed:
			grab_body(grabbable)

func _on_player_grab_body_entered(body):
	if body is RigidBody2D:
		grabbable = body

func _on_player_grab_body_exited(body):
	if body == grabbable:
		grabbable = null

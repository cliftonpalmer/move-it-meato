extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var grabbed = null

func reparent(body):
	body.get_parent().remove_child(body)
	$grab.add_child(body)
	

func _on_player_grab_body_entered(body):
	if body is RigidBody2D and not grabbed:
		(body as RigidBody2D).mode = RigidBody2D.MODE_KINEMATIC
		grabbed = body
		call_deferred("reparent", body)
		print("Grabbed " + (body as RigidBody2D).name)


func _on_player_grab_body_exited(body):
	pass # Replace with function body.

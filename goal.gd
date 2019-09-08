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

var won = false
func _on_goal_body_entered(body):
	if body is RigidBody2D:
		if (body as RigidBody2D).name == "package" and not won:
			print("You won!")
			won = true
	pass # Replace with function body.

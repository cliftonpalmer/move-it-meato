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


func _on_player_grab_body_entered(body):
	print(body.name + " entered")
	if body.name == "moveable" and not $holder.node_b:
		body.position.x = position.x
		body.position.y = position.y
		$holder.node_b = body.get_path()
	pass # Replace with function body.


func _on_player_grab_body_exited(body):
	print(body.name + " exited")
	pass # Replace with function body.

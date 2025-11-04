extends Area2D



func _ready():
	pass 


func _on_lav_body_entered(body):
	if body.name == "Player":
		body.gameOver()
		pass
	pass # Replace with function body.

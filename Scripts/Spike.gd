extends Area2D

func _ready():
	pass # Replace with function body.


func _on_Spike_body_entered(body):
	if body.name == "Player":
		body.gameOver()
		pass

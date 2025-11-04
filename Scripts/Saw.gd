extends Area2D

export(String, "rotate", "slide_and_rotate") var animationName

func _ready():
	$AnimationPlayer.play(animationName)
	pass


func _on_Saw_body_entered(body):
	if body.name == "Player":
		body.gameOver()
		pass
	

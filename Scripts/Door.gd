extends Area2D

func _ready():
	$AnimationPlayer.play("CloseTheDoor")
	pass 


func _on_AnimationTriggerArea_body_entered(body):
	
	if body.name == "Player" and body.anahtarSayisi == 1:
		$AnimationPlayer.play("OpenTheDoor")
		pass
	
	pass


func _on_AnimationTriggerArea_body_exited(body):
	if body.name == "Player" and body.anahtarSayisi == 1:
		$AnimationPlayer.play("CloseTheDoor")
		pass
	pass 


func _on_Door_body_entered(body):
	if body.name == "Player" and body.anahtarSayisi == 1:
		print("Level başarılı")
		body.levelBasariylaTamamlandi()
		
	pass 

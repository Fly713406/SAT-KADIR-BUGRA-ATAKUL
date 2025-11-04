extends Area2D

var skorDegeri = 1

func _ready():
	$AnimationPlayer.play("coin_move")
	
	pass

func _on_Coin_body_entered(body):
#	print(body)

	# eğer gelen body tipindeki düğümün ismi Player ise
	if body.name == "Player":
		Global.playerData.skor += skorDegeri
		
		# mevcut script çalıştığı düğümü sahneden siler
		queue_free()
	pass

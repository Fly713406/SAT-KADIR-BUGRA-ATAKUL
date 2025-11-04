extends Area2D

func _ready():
	pass

func _on_DoorKey_body_entered(body):
	
	# eğer gelen body düğümü ismi Player ise
	if body.name == "Player":
		print("Anahtar alındı.")
		
		# karakterin anahtar sayısı 1 artırılıyor
		body.anahtarSayisi += 1
		print("Anahtar Sayısı:"+str(body.anahtarSayisi))
		
		# script'in bağlı olduğu DoorKey düğümü sahneden
		#silinir
		queue_free()
		
	pass

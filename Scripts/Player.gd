extends KinematicBody2D

const HIZ = 350
const JUMP_POWER = 1000
const GRAVITY = 30
var hizVektoru : Vector2

var anahtarSayisi = 0
func _ready():
	hizVektoru = Vector2(0, 0) 
	
	$AnimatedSprite.play("dur")
	$UI/GameOver.hide()
	$UI/Finished.hide()
	
	
	get_tree().paused = false
	
	pass


func _physics_process(_delta):
	if position.y > 2500:
		gameOver()
		get_tree().paused = true
		return

	$Skorumuz.text = str(Global.playerData.skor)
	
	hizVektoru.x = 0

	if is_on_floor():
		hizVektoru.y = 0

		if not Input.is_action_pressed("saga") and not Input.is_action_pressed("sola"):
			$AnimatedSprite.play("dur")
		pass
	else:
		hizVektoru.y += GRAVITY
		$AnimatedSprite.play("zipla")
		pass

	if Input.is_action_pressed("saga"):
		hizVektoru.x = HIZ
		$AnimatedSprite.play("yuru")
		$AnimatedSprite.flip_h = false

	if Input.is_action_pressed("sola"):
		hizVektoru.x = -HIZ
		$AnimatedSprite.play("yuru")
		$AnimatedSprite.flip_h = true

	if is_on_floor() and Input.is_action_pressed("yukari"):
		hizVektoru.y = -JUMP_POWER
		$AnimatedSprite.play("zipla")

	move_and_slide(hizVektoru, Vector2(0, -1))
	pass


func _on_btn_restart_pressed():
	Global.playerData.skor = 0  # Skoru sıfırla
	get_tree().reload_current_scene()  # Sahneyi yeniden yükle
	pass

func _on_btn_goToMenu_pressed():
	get_tree().change_scene("res://Sahneler/AnaMenu.tscn")
	Global.playerData.skor = 0  # Skoru sıfırla
	pass
	
func gameOver():
	get_tree().paused = true
	$UI/GameOver.show()
	$UI/GameOver/CenterContainer/Panel/HBoxContainer/VBoxContainer/Label2.text = "Skorunuz: " + str(Global.playerData.skor)
	pass
	
func levelBasariylaTamamlandi():
	# Bölüm bitmeden önce kısa bir bekleme
	yield(get_tree().create_timer(1), "timeout")
	
	# Skoru UI'daki SkorLabel'a ayarla
	$UI/Finished/CenterContainer/Panel/HBoxContainer/VBoxContainer/Label2.text = "Skorunuz: %d" % Global.playerData.skor
	
	# Şu anki sahneyi kontrol et
	var current_scene = get_tree().current_scene.filename
	if current_scene == "res://Sahneler/Level3.tscn":
		# Zindandan Kaçmayı Başardınız mesajını ekleyip skoru da göster
		$UI/Finished/CenterContainer/Panel/HBoxContainer/VBoxContainer/Label2.text = "Kaçmayı Basardınız\n" + "Skorunuz: %d" % Global.playerData.skor
		$UI/Finished/CenterContainer/Panel/HBoxContainer/VBoxContainer/btn_next_level.hide()
	
	# Oyunu durdur ve başarı ekranını göster
	get_tree().paused = true
	$UI/Finished.show()

func _on_btn_next_level_pressed():
	if get_tree().current_scene.filename == "res://Sahneler/Level2.tscn":
		get_tree().change_scene("res://Sahneler/Level3.tscn")
	else:
		get_tree().change_scene("res://Sahneler/Level2.tscn")


	
	Global.playerData.skor = 0  # Skoru sıfırla

	pass 

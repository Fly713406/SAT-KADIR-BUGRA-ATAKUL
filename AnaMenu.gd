extends Control

func _ready():
	
	
	get_tree().paused = false
	pass 




func _on_btn_oyna_pressed():
	get_tree().change_scene("res://Sahneler/Level1.tscn")
	pass


func _on_btn_exit_pressed():
	
	get_tree().quit()
	pass

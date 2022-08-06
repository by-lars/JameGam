extends Spatial

func _on_Phone_button_pressed(button):
	print(button)

func loadMainScene():
	get_tree().change_scene("Main.tscn")

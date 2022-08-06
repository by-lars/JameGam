extends Spatial
func _menu_on_button_pressed(button):
	get_tree().change_scene("Intro.tscn")

func loadMainScene():
	get_tree().change_scene("Main.tscn")

extends Spatial

onready var tween = $"Tween"
onready var audio = $"AudioStreamPlayer"

func _on_Phone_button_released():
	get_tree().change_scene("Intro.tscn")


func _on_Phone_button_pressed(button):
	tween.interpolate_property(audio, "volume_db", -30, -200, 1.5, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	tween.start()

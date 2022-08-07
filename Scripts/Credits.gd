extends Spatial

onready var scorelabel = $"Control/Score"
onready var highscoreLable = $"Control/Highscore"

func _ready():
	if Global.score > Global.highscore:
		Global.highscore = Global.score 
	
	scorelabel.text = "Score: " + String(Global.score);
	highscoreLable.text = "Highscore: " + String(Global.highscore);
	
func _on_Button_button_up():
	Global.score = 0
	get_tree().change_scene("res://Main.tscn")

extends Spatial

var arrRand := []
var arrGuess := []
var i := 0

func _ready():
	arrRand.resize(6)
	for n in 6:
		arrRand[n] = randi()%9+1
		print(arrRand[n])
	#arrGuess.resize(6)

func _on_Phone_button_pressed(button):
	print(button)
	if button == 10 || button == 11:
		return
	arrGuess.append(button)
	if arrRand[i] != arrGuess[i]:
		print("false, try again")
		arrGuess = []
		i = 0
		return
	i += 1
	if i == 6:
		print("you won!")

func _menu_on_button_pressed(button):
	get_tree().change_scene("Intro.tscn")

func loadMainScene():
	get_tree().change_scene("Main.tscn")

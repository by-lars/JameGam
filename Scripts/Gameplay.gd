extends Spatial

var arrRand := []
var arrGuess := []
var i := 0

onready var numberLabel = $"UI/Number"
onready var animator = $"UI/AnimationPlayer"
onready var timeBar = $"UI/Timer"
onready var scoreLabel = $"UI/Score"
onready var cam = $"Camera"
onready var buzzer = $"Buzzer"
onready var player = $"Path/PathFollow"
onready var ohNoPlayer = $"Path/PathFollow/Phone/OhNoPlayer"
onready var playerParticles = $"Path/PathFollow/Phone/Particles"
onready var dialsound = $"Dialsoundplayer"
onready var soundtrack = $"SoundTrack"

var ohNoSounds = []

var CALL_NOW_TEXT = "CALL NOW: "
var maxTime = 45
var timeLeft = 45
var initialTimeBarWidth = 0

var isInWinningAnimation = false

func genNextNumber():
	i = 0
	for n in 6:
		arrRand[n] = randi()%9+1
	numberLabel.set_bbcode("[center]" + CALL_NOW_TEXT + PoolStringArray(arrRand).join("") + "[/center]")

func _process(delta):
	if not isInWinningAnimation:
		timeLeft -= delta
		
	timeBar.rect_size.x = (timeLeft / maxTime) * initialTimeBarWidth
	
	if timeLeft > maxTime:
		timeLeft = maxTime
		
	if timeLeft < 0:
		get_tree().change_scene("res://Credits.tscn")

func _ready():
	arrRand.resize(6)
	randomize()
	genNextNumber()
	initialTimeBarWidth = timeBar.rect_size.x
	ohNoSounds.append(preload("res://Audio/ohno/1.mp3"))
	ohNoSounds.append(preload("res://Audio/ohno/2.mp3"))
	ohNoSounds.append(preload("res://Audio/ohno/3.mp3"))
	ohNoSounds.append(preload("res://Audio/ohno/4.mp3"))
	ohNoSounds.append(preload("res://Audio/ohno/5.mp3"))
	

func _on_Phone_button_pressed(button):
	if button == 10 || button == 11:
		return
		
	if isInWinningAnimation:
		return
		
	arrGuess.append(button)
	if arrRand[i] != arrGuess[i]:
		print("false, try again")
		buzzer.play()
		arrGuess = []
		i = 0
		numberLabel.set_bbcode("[center]" + CALL_NOW_TEXT + PoolStringArray(arrRand).join("") + "[/center]")
		timeLeft -= 10
		Global.score -= 15
		animator.stop()
		animator.play("Wrong")
		cam.shake(0.5)
		scoreLabel.text = "Score: " + String(Global.score)
		return
	
	i += 1

	if i == 6:
		player.shouldMove = false
		isInWinningAnimation = true
		i = 0
		Global.score += 50
		timeLeft = maxTime
		arrGuess.clear()
		numberLabel.set_bbcode("[center]" + CALL_NOW_TEXT + PoolStringArray(arrRand).join("") + "[/center]")
		animator.stop()
		animator.play("Correct")
		dialsound.play()
		soundtrack.stop()
		cam.zoomIn(5, 1)		
		print("you won!")
	else:
		ohNoPlayer.stop()
		ohNoPlayer.stream = ohNoSounds[randi() % 5] 
		ohNoPlayer.play()
		
		animator.stop()
		animator.play("CorrectDigit")
	
		playerParticles.emitting = true
	
		var text = "[center]" + CALL_NOW_TEXT + "[color=#6ee680]"
		for n in i:
			text += String(arrRand[n])

		text += "[/color]"

		for n in range(i, 6):
			text += String(arrRand[n])

		text += "[/center]"
		numberLabel.set_bbcode(text)

		timeLeft += 5
		Global.score += 10
		player.speed = 10
		cam.zoomIn(2, 10)
	
	scoreLabel.text = "Score: " + String(Global.score)
	
	
func _on_Phone_button_released():
	player.speed = 5
	


func _on_Dialsoundplayer_finished():
	soundtrack.play()
	isInWinningAnimation = false
	player.shouldMove = true
	genNextNumber()
	

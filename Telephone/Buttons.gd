extends Spatial

signal button_pressed(button)
signal button_released()

onready var keys = [$"RootNode/Key007", $"RootNode/Key", $"RootNode/Key004", $"RootNode/Key008", $"RootNode/Key001", $"RootNode/Key005", $"RootNode/Key009", $"RootNode/Key002", $"RootNode/Key006", $"RootNode/Key010", $"RootNode/Key003", $"RootNode/Key011"]
onready var audio = $"RootNode/AudioStreamPlayer3D"
onready var tween = $"Tween"

var lastTime = 0
var time = 0
var debounce = 0.1

var sounds = []

func _process(delta):
	time += delta

func _ready():
	sounds.append(preload("res://Audio/beeps/1.wav"))
	sounds.append(preload("res://Audio/beeps/2.wav"))
	sounds.append(preload("res://Audio/beeps/3.wav"))
	sounds.append(preload("res://Audio/beeps/4.wav"))
	sounds.append(preload("res://Audio/beeps/5.wav"))
	sounds.append(preload("res://Audio/beeps/6.wav"))
	sounds.append(preload("res://Audio/beeps/7.wav"))
	sounds.append(preload("res://Audio/beeps/8.wav"))
	sounds.append(preload("res://Audio/beeps/9.wav"))
	sounds.append(preload("res://Audio/beeps/10.wav"))
	sounds.append(preload("res://Audio/beeps/11.wav"))	
		
	for key in keys:
		key.set_meta("pressedState", 0)
	tween.connect("tween_completed", self, "on_tween_completed")

func on_tween_completed(obj, key):
	if obj.get_meta("pressedState") == 1:
		obj.set_meta("pressedState", 2)
		tween.interpolate_property(obj, "transform:origin", obj.transform.origin, obj.transform.origin + (Vector3.UP * 0.05), 0.2, Tween.TRANS_BACK, Tween.EASE_IN_OUT)		
		tween.start()
	else:
		obj.set_meta("pressedState", 0)
		emit_signal("button_released")

func _on_Keypad_input_event(camera, event, position, normal, shape_idx, extra_arg_0):
	if !(event is InputEventMouseButton):
		return 
		
	if !(event.button_index == BUTTON_LEFT and event.pressed):
		return
		
	if time - lastTime < debounce:
		return
		
	lastTime = time 
		
	var obj = keys[extra_arg_0]
	if obj.get_meta("pressedState") != 0:
		return
		
	audio.stream = sounds[randi() % 10]
	audio.play()
	obj.set_meta("pressedState", 1)
	emit_signal("button_pressed", extra_arg_0)
	tween.interpolate_property(obj, "transform:origin", obj.transform.origin, obj.transform.origin - (Vector3.UP * 0.05), 0.2, Tween.TRANS_BACK, Tween.EASE_IN_OUT)		
	tween.start()

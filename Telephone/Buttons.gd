extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var key1 = $"RootNode/Key"
onready var key2 = $"RootNode/Key004"
onready var key3 = $"RootNode/Key008"
onready var key4 = $"RootNode/Key001"
onready var key5 = $"RootNode/Key005"
onready var key6 = $"RootNode/Key009"
onready var key7 = $"RootNode/Key007"
onready var key8 = $"RootNode/Key006"
onready var key9 = $"RootNode/Key010"
onready var key0 = $"RootNode/Key007"
onready var keyHash = $"RootNode/Key011"
onready var keyStar = $"RootNode/Key003"



# Called when the node enters the scene tree for the first time.
func _ready():
	print("rdy")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Keypad_input_event(camera, event, position, normal, shape_idx, extra_arg_0):
	if event is InputEventMouseButton:
		print("press")
		print(extra_arg_0)

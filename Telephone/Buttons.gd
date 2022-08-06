extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var keys = [$"RootNode/Key007", $"RootNode/Key", $"RootNode/Key004", $"RootNode/Key008", $"RootNode/Key001", $"RootNode/Key005", $"RootNode/Key009", $"RootNode/Key002", $"RootNode/Key006", $"RootNode/Key010", $"RootNode/Key003", $"RootNode/Key011"]

# Called when the node enters the scene tree for the first time.
func _ready():
	print("rdy")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Keypad_input_event(camera, event, position, normal, shape_idx, extra_arg_0):
	if event is InputEventMouseButton:
		var obj = keys[extra_arg_0]
		$Tween.interpolate_property(obj, "global_transform:origin", obj.global_transform.origin, obj.global_transform.origin - (Vector3.UP * 0.05), 0.5, Tween.TRANS_BACK, Tween.EASE_IN_OUT)		
		$Tween.start()
		print("press")

extends Spatial

onready var keys = [$"RootNode/Key007", $"RootNode/Key", $"RootNode/Key004", $"RootNode/Key008", $"RootNode/Key001", $"RootNode/Key005", $"RootNode/Key009", $"RootNode/Key002", $"RootNode/Key006", $"RootNode/Key010", $"RootNode/Key003", $"RootNode/Key011"]

func _ready():
	for key in keys:
		key.set_meta("pressedState", 0)
	$Tween.connect("tween_completed", self, "on_tween_completed")

func on_tween_completed(obj, key):
	if obj.get_meta("pressedState") == 1:
		obj.set_meta("pressedState", 2)
		$Tween.interpolate_property(obj, "global_transform:origin", obj.global_transform.origin, obj.global_transform.origin + (Vector3.UP * 0.05), 0.2, Tween.TRANS_BACK, Tween.EASE_IN_OUT)		
		$Tween.start()
	else:
		obj.set_meta("pressedState", 0)

func _on_Keypad_input_event(camera, event, position, normal, shape_idx, extra_arg_0):
	if event is InputEventMouseButton:
		var obj = keys[extra_arg_0]
		if obj.get_meta("pressedState") == 0:
			obj.set_meta("pressedState", 1)
			$Tween.interpolate_property(obj, "global_transform:origin", obj.global_transform.origin, obj.global_transform.origin - (Vector3.UP * 0.05), 0.4, Tween.TRANS_BACK, Tween.EASE_IN_OUT)		
			$Tween.start()

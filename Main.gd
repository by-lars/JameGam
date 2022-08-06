extends Spatial

var t := 0.0

func _process(delta: float) -> void:
	t+= delta 
	$Path/PathFollow.offset = t * 200.0

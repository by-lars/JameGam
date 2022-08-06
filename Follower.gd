extends Camera

onready var target = get_parent().get_node("Path/PathFollow/Phone")
var speed = 10

	
func _process(delta):
	var T = global_transform.looking_at(target.global_transform.origin, Vector3(0,1,0))
	global_transform.basis.y=lerp(global_transform.basis.y, T.basis.y, delta*speed)
	global_transform.basis.x=lerp(global_transform.basis.x, T.basis.x, delta*speed)
	global_transform.basis.z=lerp(global_transform.basis.z, T.basis.z, delta*speed)
	


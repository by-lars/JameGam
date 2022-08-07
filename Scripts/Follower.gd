extends Camera

onready var target = get_parent().get_node("Path/PathFollow/Phone")
var speed = 10

var shouldShake = false
var shakeAmount = 0.2
var elapsedShakeTime = 0
var shakeTime = 0
	
var extraZoom = 0
var extraZoomSpeed = 10
	
func shake(time):
	elapsedShakeTime = 0
	shakeTime = time
	shouldShake = true
	
func zoomIn(amount, speed):
	extraZoomSpeed = speed
	extraZoom = amount
	
func _process(delta):
	var T = global_transform.looking_at(target.global_transform.origin, Vector3(0,1,0))
	global_transform.basis.y=lerp(global_transform.basis.y, T.basis.y, delta*speed)
	global_transform.basis.x=lerp(global_transform.basis.x, T.basis.x, delta*speed)
	global_transform.basis.z=lerp(global_transform.basis.z, T.basis.z, delta*speed)
	
	fov = 80 - (global_transform.origin.distance_to(target.global_transform.origin) * 3) - extraZoom
	
	extraZoom -= delta * extraZoomSpeed
	
	if extraZoom < 0:
		extraZoom = 0
	
	if shouldShake:
		v_offset = randf() * shakeAmount
		h_offset = randf() * shakeAmount
		elapsedShakeTime += delta
		
	if elapsedShakeTime > shakeTime:
		shouldShake = false
	

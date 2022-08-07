extends PathFollow

var shouldMove = true
var speed = 5

func _process(delta):
	if shouldMove:
		offset += speed * delta 

extends Camera

onready var target = get_parent().get_node("Phone")
var speed : float

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = 0.5
	
	
func _process(delta):
	look_at(target.global_transform.origin, Vector3.UP)

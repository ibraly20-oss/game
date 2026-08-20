extends PathFollow2D
@export var max_speed :float = 850.0
@export var laps :int = 0.0
@export var acceleration :float = 0.5

var speed : float = 500

# called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
	
	# called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed += acceleration * delta 
	progress += speed *delta

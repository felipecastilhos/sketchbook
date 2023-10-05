extends Node2D

@export var numCircles : int = 12
@export var minRadius : int = 5
@export var maxRadius : int = 20
@export var colors : Array = [0x261c15ff, 0xfaf0caff, 0xf694c1ff, 0xe4e6c3ff]

var colorPallet = [0x]

var screen_size = Vector2(1080,1080)
var rng = RandomNumberGenerator.new()
var circles : Array = []
	
func _ready():
	rng.randomize()  
	generateCircles()

func _process(delta):
	generateCircles()
	queue_redraw()

func generateCircles():
	for i in range(numCircles):
		var radius = rng.randi_range(minRadius, maxRadius)
		var centerX = rng.randf_range(radius, screen_size.x)
		var centerY = rng.randf_range(radius, screen_size.y)
		var color = colors[i % colors.size()]
		circles.append({
			"center": Vector2(centerX, centerY),
			"radius": radius,
			"color": color
		})

func _draw():
	for circle in circles:
		draw_circle(circle["center"], circle["radius"], circle["color"])

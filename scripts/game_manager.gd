extends Node

@onready var point_label = $"../UI/Panel/Points"
@onready var timer = $Timer
@export var hearts : Array[Node]

var points = 0
var health = 3

func decrease_health():
	health -= 1
	print("Health: " + str(health))
	
	#for decreasing hearts in UI
	for h in 3:
		if h < health:
			hearts[h].show()
		else:
			hearts[h].hide()
	
	if(health == 0):
		get_tree().reload_current_scene()
		

func add_point():
	points += 1
	print("Your Points= ", points)
	point_label.text = "Points = " + str(points)

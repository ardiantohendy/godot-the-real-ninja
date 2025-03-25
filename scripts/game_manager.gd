extends Node


var points = 0
@onready var point_label = $"../UI/Panel/Points"

func add_point():
	points += 1
	print("Your Points= ", points)
	point_label.text = "Points = " + str(points)

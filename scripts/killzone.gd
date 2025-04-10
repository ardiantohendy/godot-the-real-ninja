extends Area2D

@onready var timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		print("You Dead")
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()
		timer.start()	

func _on_timer_timeout() -> void:
	print("Restarting game...")
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()

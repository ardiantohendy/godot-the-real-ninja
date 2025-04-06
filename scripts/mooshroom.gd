extends RigidBody2D

@onready var timer = $Timer


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		var y_delta = position.y - body.position.y
		if y_delta >= 30:
			body.jump()
			queue_free()
			print("ENEMY DEAD!!!")
		else:
			Engine.time_scale = 0.5
			body.get_node("CollisionShape2D").queue_free()
			timer.start()	
			print("YOU DEAD!!!")



func _on_timer_timeout() -> void:
	print("Restarting game...")
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()

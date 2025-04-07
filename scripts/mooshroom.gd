extends RigidBody2D

@onready var timer = $Timer
@onready var game_manager: Node = $"../../../GameManager"


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		var y_delta = position.y - body.position.y
		if y_delta >= 30:
			body.jump()
			queue_free()
			print("ENEMY DEAD!!!")
		else:
			body.get_hit()
			game_manager.decrease_health()
			#body.get_node("CollisionShape2D").queue_free()
			#timer.start()	
			#print("YOU DEAD!!!")



func _on_timer_timeout() -> void:
	print("Restarting game...")
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()

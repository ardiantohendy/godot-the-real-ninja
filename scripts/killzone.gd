extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		print("YOU DEAD")
		get_tree().reload_current_scene()

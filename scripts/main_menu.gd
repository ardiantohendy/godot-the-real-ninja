extends Node



func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

extends Area2D


@onready var game_manager = $"../../GameManager"
@export var target_level : PackedScene

func _ready() -> void:
	if game_manager.points < 40:
		visible = false
		get_node("CollisionShape2D").set_deferred("disabled", true) 
	else :
		visible = true
		get_node("CollisionShape2D").set_deferred("disabled", false) 

func _process(delta: float) -> void:
	if game_manager.points >= 40:
		visible = true
		get_node("CollisionShape2D").set_deferred("disabled", false) 
		set_process(false)
		
func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		queue_free()
		print("You Win")
		get_tree().change_scene_to_packed(target_level)

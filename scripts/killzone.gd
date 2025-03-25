extends Area2D


@onready var animated_sprite_2d: AnimatedSprite2D
func _ready():
	print("AnimatedSprite2D:", animated_sprite_2d)  # Cek apakah null

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		if animated_sprite_2d:
			animated_sprite_2d.play("dead")
		else:
			print("ERROR: animated_sprite_2d is null!")
		print("You Dead!")

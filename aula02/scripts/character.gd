class_name Player

var player = preload("res://aula02/player.tscn").instantiate() as CharacterBody2D

# cena, peronsagem, posicao
func _init(parent: Node2D, character: String, new_position: Vector2, speed: float = 300, jump_force: float = 400) -> void:
	match character:
		"mario": player.get_node("Sprite").texture = preload("res://aula02/sprites/mario.png")
		"luigi": player.get_node("Sprite").texture = preload("res://aula02/sprites/luigi.png")
	
	player.global_position = new_position
	player.SPEED = speed
	player.JUMP_VELOCITY = -jump_force
	parent.add_child(player)

extends Node2D

@export var strong: int = 0
@export var equipament: int = 0

var attack: int = 5:
	get:
		return attack + strong + equipament
		


var life: int = 0:
	get:
		return life
	
	set(value):
		if value > 1:
			print("valor invalido!")
			return
		
		print("foi adicionado +%s!" % value)
		life += value


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_down"):
		print(attack)
	
	if Input.is_action_just_pressed("ui_up"):
		life = 12

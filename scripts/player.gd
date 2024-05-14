class_name Player extends CharacterBase

var jumping := false


#func _process(_delta: float) -> void:
	#if is_on_floor() && jumping:
		#jumping = false


func on_animation_idle() -> void:
	pass


func on_animation_walk() -> void:
	print("som de passos")


func on_animation_jump() -> void:
	print("som de jump")
	#if !jumping:
		#print("som de jump")
		#jumping = true

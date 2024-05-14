@icon("res://assets/icon/character.png") # muda o icone na arvore de componentes
class_name CharacterBase extends CharacterBody2D

@export_category("Configuração do Player")
@export var speed := 300.0
@export var jump_force := 400.0

@export_category("Configuração das Animações")
@export var animation: NodePath
@export var idle: String
@export var walk: String
@export var jump: String
@export var fall: String

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var animator: AnimatedSprite2D


func _ready() -> void:
	if animation:
		animator = get_node(animation)


func _process(_delta: float) -> void:
	_animations()


func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_accept") && is_on_floor():
		velocity.y = - jump_force
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	move_and_slide()
	
	if animator && velocity.x != 0:
		animator.flip_h = velocity.x < 0


func _animations() -> void:
	if !animator:
		return
	
	if !is_on_floor():
		if velocity.y < 0: # subindo
			on_animation_jump()
			animator.play(jump)
		else:
			on_animation_fall()
			animator.play(fall)
	else:
		if velocity.x != 0:
			on_animation_walk()
			animator.play(walk)
		else:
			on_animation_idle()
			animator.play(idle)


func on_animation_idle() -> void:
	pass


func on_animation_walk() -> void:
	pass


func on_animation_jump() -> void:
	pass


func on_animation_fall() -> void:
	pass



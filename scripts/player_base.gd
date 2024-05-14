class_name PlayerBase extends CharacterBody2D

const SHOOT = preload("res://prefabs/shoot/shoot.tscn")

@export var life := 2
@export var speed := 300

@onready var weapon: Marker2D = $Weapon


func _process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity = direction.normalized() * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed) # funciona como um lerp
	
	if Input.is_action_just_pressed("ui_shoot"):
		_shooting()
	
	if Input.is_action_just_pressed("ui_bomb"):
		bomb()
	
	if Input.is_action_just_pressed("ui_special"):
		special()


func _physics_process(delta: float) -> void:
	move_and_slide()


func _shooting() -> void:
	var shoot = SHOOT.instantiate()
	shoot.global_position = weapon.global_position
	get_parent().add_child(shoot)


func bomb() -> void:
	pass


func special() -> void:
	print("Especial pressionado")

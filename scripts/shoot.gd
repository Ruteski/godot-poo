extends Node2D

@export var speed := 10.0


func _physics_process(delta: float) -> void:
	translate(Vector2.UP * speed)


func _on_screen_notifier_screen_exited() -> void:
	queue_free()

extends Node2D


func _ready() -> void:
	var player = Player.new(self, "luigi", $Spawner.global_position, 100, 800)
	var player2 = Player.new(self, "mario", $Spawner2.global_position, 300, 200)

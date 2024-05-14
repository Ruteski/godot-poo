extends Node2D

var fusca = Car.new(80, Color.RED)
var palio = Car.new(120, Color.BLACK)
var hayabuza = Motorcycle.new(300, Color.BLUE)


func _ready() -> void:
	print(fusca.speed)
	print(palio.speed)
	palio.acceleration()
	fusca.wheel_amount()
	hayabuza.wheel_amount()
	fusca.walking_in_rain()
	hayabuza.walking_in_traffic()


class Vehicle:
	var speed: float
	var color: Color
	var wheel: int

	func acceleration() -> void:
		print("Você está acelerando a %s km/h" % speed)
		
	func brake() -> void:
		print("Você está freiando!")
	
	func wheel_amount() -> void:
		print("Este veículo contem %s rodas" % wheel)


class Car extends Vehicle:
	
	func _init(speed: float, color: Color) -> void:
		self.speed = speed
		self.color = color
		self.wheel = 4
	
	func walking_in_rain() -> void:
		print("Andando na chuva sem problemas!")


class Motorcycle extends Vehicle:
	
	func _init(speed: float, color: Color) -> void:
		self.speed = speed
		self.color = color
		self.wheel = 2
	
	func walking_in_traffic() -> void:
		print("Engarrafamento não é um problema para mim!")

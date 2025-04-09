extends CharacterBody2D

@export var acceleration: float = 1.09
@onready var rng = RandomNumberGenerator.new()
@onready var ball_res = 6
@onready var speed_magnitude = rng.randf_range(75,80)
@onready var speed_y = rng.randf_range(sqrt(3)/2, 0.5)
@onready var speed_x = rng.randf_range(sqrt(3)/2, 0.5)
@onready var x_vector_sign = get_positive_or_negative()
@onready var y_vector_sign = get_positive_or_negative()

func get_positive_or_negative():
	var rng_result = rng.randf_range(-1,1)
	if rng_result > 0:
		return 1
	return -1

func _ready() -> void:
	velocity = speed_magnitude * Vector2(x_vector_sign * speed_x, y_vector_sign * speed_y)
	print(acceleration)

func _physics_process(delta: float) -> void:
	position += velocity * delta
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
		if collision_info.get_collider().is_class("CharacterBody2D"):
			velocity = acceleration*velocity
			#print("velocity magnitude after collision: "+ str(velocity.length()))

extends CharacterBody2D

@export var acceleration: int=0
@onready var rng = RandomNumberGenerator.new()
@onready var ball_res = 6

func get_positive_or_negative():
	var rng_result = rng.randf_range(-1,1)
	if rng_result > 0:
		return 1
	return -1

func _ready() -> void:
	var rng_x = rng.randf_range(30,45)
	var rng_y = rng.randf_range(30,45)
	var x_vector_sign = get_positive_or_negative()
	var y_vector_sign = get_positive_or_negative()
	velocity = Vector2(x_vector_sign * rng_x, y_vector_sign*rng_y)

func _physics_process(delta: float) -> void:
	var acceleration_vector = velocity.normalized() * (0.00000001 * acceleration)
	#print(acceleration_vector)
	position += velocity * delta
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
		if collision_info.get_collider().is_class("CharacterBody2D"):
			velocity += velocity + acceleration_vector*delta

extends CharacterBody2D

@export var force_magnitude: int

@onready var rng = RandomNumberGenerator.new()
@onready var force: Vector2
@onready var ball_res = 6

func get_positive_or_negative():
	var rng_result = rng.randf_range(-1,1)
	if rng_result > 0:
		return 1
	return -1

func _ready() -> void:
	var rng_x = rng.randf_range(90,120)
	var rng_y = rng.randf_range(90,120)
	var x_vector_sign = get_positive_or_negative()
	var y_vector_sign = get_positive_or_negative()
	velocity = Vector2(x_vector_sign * rng_x, y_vector_sign*rng_y)
	#apply_force(force_magnitude * force)

func _physics_process(delta: float) -> void:
	position += velocity * delta
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
	

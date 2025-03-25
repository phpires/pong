extends CharacterBody2D

@export var force_magnitude: int

@onready var rng = RandomNumberGenerator.new()
@onready var force: Vector2
@onready var ball_res = 6

func apply_collision(plane_normal: Vector2) -> void:
	var unit_normal = plane_normal.normalized()
	#var colision_angle = PI - 2 * linear_velocity.angle_to(unit_normal)
	#linear_velocity = Vector2(cos(colision_angle), sin(colision_angle))
	
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
	velocity = Vector2(x_vector_sign*rng_x, y_vector_sign*rng_y)
	#apply_force(force_magnitude * force)

func _physics_process(delta: float) -> void:
	position += velocity * delta
	

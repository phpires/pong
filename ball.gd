extends RigidBody2D

@export var force_magnitude: int

@onready var rng = RandomNumberGenerator.new()
@onready var force: Vector2
@onready var ball_res = 6

func apply_collision_force(unit_new_direction_force_vector: Vector2) -> void:
	var new_force = unit_new_direction_force_vector * force_magnitude * force
	apply_force(new_force)

func get_positive_or_negative():
	var rng_result = rng.randf_range(-1,1)
	if rng_result > 0:
		return 1
	return -1

func _ready() -> void:
	var rng_x = rng.randf_range(0,120)
	var rng_y = rng.randf_range(0,120)
	var x_vector_sign = get_positive_or_negative()
	var y_vector_sign = get_positive_or_negative()
	force = Vector2(x_vector_sign * rng_x, y_vector_sign * rng_y)
	print("force: " + str(force))
	print("force magnitude: " + str(force_magnitude))
	apply_force(force_magnitude * force)

func _physics_process(delta: float) -> void:
	
	pass

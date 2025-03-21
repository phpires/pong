extends Node2D

@onready var screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	var ball_position = $ball.position
	if ball_position.y < 0:
		$ball.apply_collision_force(Vector2(0,1))
	if ball_position.x < 0:
		$ball.apply_collision_force(Vector2(0,1))
	if ball_position.y < 0:
		$ball.apply_collision_force(Vector2(0,1))
	if ball_position.y < 0:
		$ball.apply_collision_force(Vector2(0,1))

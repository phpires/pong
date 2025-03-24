extends Node2D

@onready var screen_size = get_viewport_rect().size
@onready var plane_origin_to_xmax = MyPlane.new(Vector2.ZERO, Vector2(screen_size.x, 0))
@onready var plane_origin_to_ymax = MyPlane.new(Vector2.ZERO, Vector2(0, screen_size.y))
@onready var plane_xmax_to_x_and_y_max = MyPlane.new(screen_size, Vector2(screen_size.x, 0))
@onready var plane_ymax_to_x_and_y_max = MyPlane.new(screen_size, Vector2(0, screen_size.y))

func _physics_process(delta: float) -> void:
	var ball_position = $ball.position
	
	if plane_origin_to_xmax.calculate_distance_to(ball_position) == 0:
		$ball.apply_collision(plane_origin_to_xmax.get_normal())
	if plane_origin_to_ymax.calculate_distance_to(ball_position) == 0:
		$ball.apply_collision(plane_origin_to_ymax.get_normal())
	if plane_xmax_to_x_and_y_max.calculate_distance_to(ball_position) == 0:
		$ball.apply_collision(plane_xmax_to_x_and_y_max.get_normal())
	if plane_ymax_to_x_and_y_max.calculate_distance_to(ball_position) == 0:
		$ball.apply_collision(plane_ymax_to_x_and_y_max.get_normal())

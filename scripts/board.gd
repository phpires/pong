class_name Board
extends Node2D

@onready var screen_size = get_viewport_rect().size
@onready var plane_origin_to_xmax = MyPlane.new(Vector2.ZERO, Vector2(screen_size.x, 0))
@onready var plane_origin_to_ymax = MyPlane.new(Vector2.ZERO, Vector2(0, screen_size.y))
@onready var plane_xmax_to_x_and_y_max = MyPlane.new(screen_size, Vector2(screen_size.x, 0))
@onready var plane_ymax_to_x_and_y_max = MyPlane.new(screen_size, Vector2(0, screen_size.y))

func _physics_process(delta: float) -> void:
	pass

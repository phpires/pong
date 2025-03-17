extends CharacterBody2D

@export var speed = 200
@export var player_order = 1

@onready var screen_size = get_viewport_rect().size
@onready var higher_y_limit = screen_size.y
@onready var player_sprite_size = 32

func _ready() -> void:
	velocity.x = 0

func set_initial_position() -> Vector2:
	return Vector2(player_sprite_size/2, player_sprite_size/2)
	
func _physics_process(_delta: float) -> void:
	if player_order == 1:
		velocity.y = Input.get_axis("move_up_player_one", "move_down_player_one") * speed
	if player_order == 2:
		velocity.y = Input.get_axis("move_up_player_two", "move_down_player_two") * speed
	position.y = clamp(position.y, player_sprite_size/2, screen_size.y - player_sprite_size/2)
	move_and_slide()

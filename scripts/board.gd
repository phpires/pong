class_name Board
extends Node2D

@onready var screen_size = get_viewport_rect().size

func _on_ready() -> void:
	var player_score = {
		"player_one": 0,
		"player_two": 0
	}

func _process(delta: float) -> void:
	
	pass

class_name Board
extends Node2D
signal game_ended

@export var player_x_padding : int = 20

@onready var screen_size = get_viewport_rect().size
@onready var player_score: Dictionary = {
		"player_one": 0,
		"player_two": 0
	}
@onready var PLAYER_ONE_INITIAL_POSITION := Vector2(45, screen_size.y/2)
@onready var PLAYER_TWO_INITIAL_POSITION := Vector2(screen_size.x + player_x_padding, screen_size.y/2)
@onready var BALL_INITIAL_POSITION := Vector2(screen_size.x/2, screen_size.y/2)

func player_scored(player: String) -> void:
	print("player scored: "+player)
	player_score[player] += 1
	if player_score[player] >= 3:
		$Field.set_player_score_lights(player, 2)
		game_over(player)
	else:
		$Field.set_player_score_lights(player, player_score[player]-1)
		$WaitAfterScore.start(3.0)
func game_over(player: String) -> void:
	$player.hide()
	$player_2.hide()
	$ball.hide()
	$GameUI.show_winner_message(player)

func new_game() -> void:
	player_score["player_one"] = 0
	player_score["player_two"] = 0
	$player.show()
	$player_2.show()
	$ball.show()
	reset_positions()

func reset_positions() -> void:
	$player.position = PLAYER_ONE_INITIAL_POSITION
	$player_2.position = PLAYER_TWO_INITIAL_POSITION
	$ball.position = BALL_INITIAL_POSITION
	$WaitAfterScore.stop()

func _on_timer_timeout() -> void:
	reset_positions()

func _on_player_one_score_area_body_entered(body: Node2D) -> void:
	if body.name == "ball":
		player_scored("player_one")

func _on_player_two_score_area_body_entered(body: Node2D) -> void:
	if body.name == "ball":
		player_scored("player_two")

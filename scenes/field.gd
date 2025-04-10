extends StaticBody2D

@onready
var player_score_lights: Dictionary = {
		"player_one": [
			$TextureRect/PlayerOneScoreOne, 
			$TextureRect/PlayerOneScoreTwo, 
			$TextureRect/PlayerOneScoreThree
		],
		"player_two": [
			$TextureRect/PlayerTwoScoreOne,
			$TextureRect/PlayerTwoScoreTwo,
			$TextureRect/PlayerTwoScoreThree
		]
	}

func _ready() -> void:
	reset_lights()
	
func set_player_score_lights(player: String, score: int) -> void:
	turn_on_light(player_score_lights[player][score])

func reset_lights() -> void:
	for key in player_score_lights:
		player_score_lights["player_one"].map(turn_off_light)
		player_score_lights["player_two"].map(turn_off_light)

func turn_off_light(light: ColorRect) -> void:
	light.set_visible(false)
func turn_on_light(light: ColorRect) -> void:
	light.set_visible(true)

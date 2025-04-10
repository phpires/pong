extends CanvasLayer

signal start_game

func show_winner_message(player):
	var winner_text = {
		"player_one": "Player one won!",
		"player_two": "Player two won!"
	}
	$Message.text = winner_text[player]
	$Message.show()
	$MessageTimer.start(4.0)

func _on_message_timer_timeout() -> void:
	$MessageTimer.stop()
	$Message.hide()
	$Start.show()

func _on_start_pressed() -> void:
	$Start.hide()
	start_game.emit()

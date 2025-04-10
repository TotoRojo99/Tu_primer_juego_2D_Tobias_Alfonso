extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_Game_over():
	show_message("Game Over")
	
	await $MessageTimer.timeout
	
	$Message.text = "Dodge the Creeps!"
	$Message.show()
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func update_score(score):
	$ScoreLabel.text = str(score)
	
func on_start_button_pressed():
	$StartButton.hide()
	
	start_game.emit()
	
func on_message_timer_timeout():
	$Message.hide()

extends Area2D

@onready var timer = $Timer
@onready var game_manager = $/root/Game/GameManager


func _on_body_entered(body):
	game_manager.end_game()

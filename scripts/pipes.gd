extends Node2D

class_name pipes

@onready var player = $"/root/Game/Player"
@onready var game_manager = $/root/Game/GameManager

var has_passed_pipe = false
var speed = 0

func set_speed(new_speed):
	speed = new_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += delta * speed
	check_player_pass()
	check_pipe_destroy()

func check_player_pass():
	if player.position.x > position.x and not has_passed_pipe:
		game_manager.add_point()
		has_passed_pipe = true
	elif player.position.x <= position.x: 
		has_passed_pipe = false
		
func check_pipe_destroy():
	if position.x < 50:
		queue_free()

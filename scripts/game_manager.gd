extends Node

@onready var score_label = $"../ScoreLabel"
@onready var ui = $"../UI"
@onready var bottom_pipe = $"../Pipes/BottomPipe"
@onready var top_pipe = $"../Pipes/TopPipe"
@onready var player = $"../Player"

var score = 0

func add_point():
	score += 1
	score_label.text = str(score)
	
func start_game():
	score = 0
	bottom_pipe.start_animation()
	top_pipe.start_animation()
	player.start_animation()

func end_game():
	bottom_pipe.stop_animation()
	top_pipe.stop_animation()
	player.set_physics_process(false)
	ui.update_points(score)
	ui.on_game_over()

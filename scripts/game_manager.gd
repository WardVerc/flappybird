extends Node

@onready var score_label = $"../ScoreLabel"
@onready var ui = $"../UI"
@onready var pipes = $"../PipeSpawner"
@onready var player = $"../Player"

var score = 0

func add_point():
	score += 1
	score_label.text = str(score)
	
func start_game():
	score = 0
	pipes.start_spawning()
	player.start_animation()
	pipes.remove_pipes()
	

func end_game():
	pipes.stop()
	player.velocity.y = 0
	player.set_physics_process(false)
	ui.update_points(score)
	ui.on_game_over()

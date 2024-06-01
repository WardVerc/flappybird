extends CanvasLayer

class_name ui
signal game_started
var game_points = 0

@onready var death_screen = $death_screen
@onready var score_label = $/root/Game/ScoreLabel

func _ready():
	death_screen.visible = false
	
func update_points(points: int):
	game_points = points
	
func on_game_over():
	score_label.visible = false
	death_screen.visible = true
	$death_screen/end_score_display/end_score_label.text = str(game_points)
	
func _on_restart_button_pressed():
	get_tree().reload_current_scene()

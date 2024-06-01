extends CanvasLayer

class_name ui
signal game_started
var game_points = 0

@onready var main_menu_screen = $main_menu_screen
@onready var death_screen = $death_screen
@onready var score_label = $/root/Game/ScoreLabel
@onready var game_manager = $/root/Game/GameManager
@onready var end_score_label = $death_screen/end_score_display/end_score_label

func _ready():
	death_screen.visible = false
	score_label.visible = false
	
func update_points(points: int):
	game_points = points
	
func on_start_game():
	main_menu_screen.visible = false
	score_label.visible = true
	game_manager.start_game()
	
func on_game_over():
	score_label.visible = false
	death_screen.visible = true
	end_score_label.text = str(game_points)
	
func _on_restart_button_pressed():
	score_label.text = "0"
	end_score_label.text = "0"
	update_points(0)
	score_label.visible = true
	death_screen.visible = false
	on_start_game()
	
func _on_start_button_pressed():
	on_start_game()

func _on_exit_button_pressed():
	get_tree().reload_current_scene()

func _on_quit_button_pressed():
	get_tree().quit()

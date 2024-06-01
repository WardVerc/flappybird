extends AnimatableBody2D

@onready var player = $"../../Player"
@onready var game_manager = $/root/Game/GameManager
@onready var animation_player = $AnimationPlayer

var has_passed_pipe = false

func _process(delta):
	check_pass()

func check_pass():
	if player.position.x > position.x and not has_passed_pipe:
		game_manager.add_point()
		has_passed_pipe = true
	elif player.position.x <= position.x: 
		has_passed_pipe = false

func stop_animation():
	animation_player.pause()

extends AnimatableBody2D

@onready var player = $"../../Player"
@onready var game_manager = $/root/Game/GameManager
@onready var animation_player = $AnimationPlayer

var has_passed_pipe = false

func _ready():
	animation_player.stop()
	
func start_animation():
	animation_player.stop(true) # the parameter true will 
	# reset the position, default pauses the animation
	animation_player.play()
	
func stop_animation():
	animation_player.pause()

func _process(delta):
	check_pass()

func check_pass():
	if player.position.x > position.x and not has_passed_pipe:
		game_manager.add_point()
		has_passed_pipe = true
	elif player.position.x <= position.x: 
		has_passed_pipe = false

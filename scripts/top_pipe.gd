extends AnimatableBody2D

@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.stop()

func start_animation():
	animation_player.stop(true) # the parameter true will 
	# reset the position, default pauses the animation
	animation_player.play()
	
func stop_animation():
	animation_player.pause()

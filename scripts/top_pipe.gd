extends AnimatableBody2D

@onready var animation_player = $AnimationPlayer

func stop_animation():
	animation_player.pause()

extends Node

var pipes_scene = preload("res://scenes/pipes.tscn")
@onready var spawn_timer = $Timer

func _ready():
	spawn_timer.timeout.connect(spawn_pipe)
	
func start_spawning():
	spawn_timer.start()
	
func spawn_pipe():
	var pipe = pipes_scene.instantiate() as pipes
	add_child(pipe)

	var viewport_rect = get_viewport().get_camera_2d().get_viewport_rect()
	var half_height = viewport_rect.size.y / 2
	pipe.position.x = viewport_rect.end.x - 700
	pipe.position.y = randf_range(viewport_rect.size.y * 0.5 - half_height, viewport_rect.size.y * 0.6 - half_height)
	pipe.set_speed(-120)
	
func stop():
	spawn_timer.stop()
	for pipe in get_children().filter(func (child): return child is pipes):
		(pipe as pipes).speed = 0

func remove_pipes():
	for pipe in get_children().filter(func (child): return child is pipes):
		remove_child(pipe)
		pipe.queue_free()

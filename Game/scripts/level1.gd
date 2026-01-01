extends Node2D

func _ready():
	Engine.time_scale = 1.0
	get_tree().paused = false
	GameManager.start_level()
	Music.play_music(preload("res://assets/music/DavidKBD - Pink Bloom Pack - 08 - Lost Spaceship's Signal.ogg"))

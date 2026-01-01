extends Node2D

func _ready():
	Engine.time_scale = 1.0
	GameManager.start_level()
	print("Level 2!")
	Music.play_music(preload("res://assets/music/time_for_adventure.mp3"))

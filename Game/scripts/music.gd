extends AudioStreamPlayer2D

@onready var music: AudioStreamPlayer2D = $"."

func play_music(file: AudioStream):
	if music.stream == file:
		return 
	
	music.stream = file
	music.play()

func stop_music():
	Music.play_music(preload("res://assets/sounds/hurt.wav"))
	music.stop()

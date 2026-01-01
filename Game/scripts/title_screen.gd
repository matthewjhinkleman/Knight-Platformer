extends Control

@export var first_level: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Music.play_music(preload("res://assets/music/flowerbed_fields.ogg"))

func _process(_delta):
	# Detect input to start game
	if Input.is_action_just_pressed("start"):
		start_game()

func start_game():
	# Load the first level
	get_tree().change_scene_to_packed(first_level)

extends Control

@export var next_level: PackedScene
@onready var level_coins: Label = $LevelCoins

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Music.play_music(preload("res://assets/music/flowerbed_fields.ogg"))
	level_coins.text = "Level Coins: " + str(GameManager.level_score) + "/25"

func _process(_delta):
	# Detect input to start game
	if Input.is_action_just_pressed("start"):
		start_next_level()

func start_next_level():
	# Load the first level
	get_tree().change_scene_to_packed(next_level)

extends CanvasLayer

@onready var game_manager = %GameManager
@onready var score_label = $ScoreLabel   

func _ready():
	score_label.text = str(game_manager.score)
	game_manager.score_changed.connect(_on_score_changed)

func _on_score_changed(new_score):
	score_label.text = str(new_score)

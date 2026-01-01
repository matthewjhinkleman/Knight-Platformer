extends CanvasLayer

func _process(_delta):
	if Input.is_action_just_pressed("start"):
		restart_level()

func restart_level():
	GameManager.reset_level_score()
	get_tree().reload_current_scene()
	queue_free()

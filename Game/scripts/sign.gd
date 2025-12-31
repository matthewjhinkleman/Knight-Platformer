extends Area2D

@export var next_level: PackedScene

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player" and next_level:
		call_deferred("_change_level")

func _change_level():
	get_tree().change_scene_to_packed(next_level)

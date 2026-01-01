extends Area2D

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body):
	print("You died!")
	Engine.time_scale = 0.5
	animation_player.play("Death")
	body.die()
	body.get_node("CollisionShape2D").queue_free()
	var death_screen = preload("res://scenes/death_screen.tscn").instantiate()
	get_tree().current_scene.add_child(death_screen)
	timer.start()


func _on_timer_timeout():
	get_tree().paused = true

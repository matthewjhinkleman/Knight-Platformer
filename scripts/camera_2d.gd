extends Camera2D

@export var base_resolution := Vector2(1280, 720)
@export var base_zoom := 3.5

func _ready():
	update_zoom()
	get_viewport().size_changed.connect(update_zoom)

func update_zoom():
	var window_size = get_viewport().get_visible_rect().size

	var scale_x = window_size.x / base_resolution.x
	var scale_y = window_size.y / base_resolution.y

	var scale = min(scale_x, scale_y)

	# Apply base zoom, then adjust for resolution
	var final_zoom = base_zoom / scale

	zoom = Vector2(final_zoom, final_zoom)

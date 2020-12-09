extends Node2D

export (NodePath) var visibility_tween_path

onready var platforms := get_children()

var _visibility_tween: Tween

func _ready() -> void:
	for platform in platforms:
		platform.modulate = Color.transparent
	_visibility_tween = get_node(visibility_tween_path)

func make_visible(time: float):
	for platform in platforms:
		_visibility_tween.interpolate_property(platform, "modulate", platform.modulate, Color.white, time, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		_visibility_tween.start()
		yield(_visibility_tween, "tween_completed")

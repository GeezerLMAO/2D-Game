extends Node2D

export (Array, NodePath) var levels: Array

onready var _cam_positions := $CameraPositions.get_children()
onready var _player_detectors := $PlayerDetectors.get_children()
onready var _doors := $Doors.get_children()
onready var _level_count := levels.size()
onready var _cam := $Camera2D

var _current_level := 0
var _current_cam_pos := 0

func _ready() -> void:
	for player_detector in _player_detectors:
		player_detector.connect("body_entered", self, "_on_PlayerDetect_triggered")
	for door in _doors:
		door.connect("body_entered", self, "_on_Door_Triggered")

func _on_Door_Triggered(body: Node) -> void:
	if _current_level < _level_count:
		var level := get_node(levels[_current_level])
		level.make_visible(1)
		_current_level += 1
	print("Do something...")

func _on_PlayerDetect_triggered(body: Node) -> void:
	if _current_cam_pos < _cam_positions.size():
		_cam.move(_cam_positions[_current_cam_pos].position, 0.5)
		_current_cam_pos += 1


extends Camera2D

onready var _tween := $Tween

func move(move_position: Vector2, duration: float) -> void:
	_tween.interpolate_property(self, "position", position, move_position, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	_tween.start()


func _on_PlayerFall_body_entered(body: Node) -> void:
	get_tree().reload_current_scene()

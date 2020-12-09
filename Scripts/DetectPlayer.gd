extends Area2D

signal player_detected

export (float) var bob_value := 10.0

onready var move_tween := $Tween
var bobbed := false

func _ready() -> void:
	move_tween.connect("tween_completed", self, "_on_tween_completed")
	_bob()

func _bob(down: bool = true) -> void:
	var final := Vector2(position.x, position.y + bob_value) if (down == true) else Vector2(position.x, position.y - bob_value)
	move_tween.interpolate_property(self, "position", position, final, 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	move_tween.start()

func _on_tween_completed(object, key):
	bobbed = !bobbed
	_bob(bobbed)

func _on_DetectPlayer_body_entered(body: Node) -> void:
	var particles2D := $Particles2D
	particles2D.emitting = true
	

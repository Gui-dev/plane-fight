extends Area2D


var speed := 300


func _process(delta: float) -> void:
  translate(Vector2.UP * speed * delta)


func _on_notifier_screen_exited() -> void:
  queue_free()

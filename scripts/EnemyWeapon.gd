extends Node2D


var Shoot = preload('res://prefabs/EnemyShooting.tscn')


func _on_timer_timeout() -> void:
  var shoot = Shoot.instance()
  shoot.transform = global_transform
  shoot.global_position = global_position
  get_tree().root.add_child(shoot)

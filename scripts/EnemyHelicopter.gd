extends Area2D


export(int) var energy = 3


func _ready() -> void:
  pass


func apply_damage() -> void:
  energy -= 1
  
  if energy <= 0:
    queue_free()

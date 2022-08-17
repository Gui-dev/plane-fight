extends Node2D


var target_on_player


func _ready() -> void:
  target_on_player = get_tree().get_nodes_in_group('player')


func _process(_delta: float) -> void:
  if target_on_player:
    look_at(target_on_player[0].global_position)

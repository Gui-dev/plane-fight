extends Area2D


export(int) var energy = 3
export(PackedScene) var Explosion


func apply_damage() -> void:
  energy -= 1
  
  if energy <= 0:
    var explosion_temp = Explosion.instance()
    get_tree().root.add_child(explosion_temp)
    explosion_temp.global_position = global_position
    _death()
  else:
    _blink()


func _death() -> void:
  $sprite.queue_free()
  $destroyed.visible = true
  $collision.queue_free()


func _blink() -> void:
  $sprite.modulate = Color.red
  $timer_blink.start()


func _on_timer_blink_timeout() -> void:
  $sprite.modulate = Color.white
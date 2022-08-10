extends Area2D


var speed = 200
var movement = Vector2()


func _process(delta: float) -> void:
  movement.x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
  movement.y = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
  position += movement.normalized() * speed * delta

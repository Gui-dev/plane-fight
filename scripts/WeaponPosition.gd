extends Position2D


const SHOT = preload('res://prefabs/PlayerShot.tscn')


func _process(_delta: float) -> void:
  if Input.is_action_just_pressed('ui_shot') and get_parent().visible:
    shooting()


func shooting() -> void:
  var shoot = SHOT.instance()
  get_tree().root.add_child(shoot)
  shoot.global_position = global_position

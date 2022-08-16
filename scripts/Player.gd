extends Area2D


var speed = 200
var movement = Vector2()
var smooth := 0.0
var weapon := 0
var lifes := 3
var death := false
onready var animation = $animation_tree
onready var weapons = $weapons


func _process(delta: float) -> void:
  movement.x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
  movement.y = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
  position += movement.normalized() * speed * delta
  
  smooth = lerp(smooth, movement.x, 50 * delta)
  animation.set('parameters/blend_position', smooth)


func upgrade_weapon() -> void:
  weapon += 1
  
  if weapon < weapons.get_child_count():
    for weapon_selected in weapons.get_children():
      weapon_selected.visible = false
    
    weapons.get_child(weapon).visible = true


func apply_damage() -> void:
  lifes -= 1
  
  if lifes >= 0 and not death:
    $collision.disabled = true
    for _flash_ship in range(12):
      yield(get_tree().create_timer(.1), 'timeout')
      $sprite.visible = !$sprite.visible
      
    $collision.disabled = false
    $sprite.visible = true
  elif lifes < 0 and not death:
    death = true
    $collision.disabled = true
    $sprite.visible = false
    set_process(false)
  

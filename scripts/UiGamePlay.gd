extends Control


var Life = preload('res://prefabs/IconLifes.tscn')


func _ready() -> void:
  GameController.connect('update_score', self, '_update_score')
  GameController.connect('update_lifes', self, '_update_lifes')


func _update_score(score: int) -> void:
  $player_one/player_one_score.text = str(score)


func _update_lifes(lifes: int) -> void:
  for icon_life in $player_one/container.get_children():
    icon_life.queue_free()
  
  for _quantity_life in range(lifes):
    var life = Life.instance()
    $player_one/container.add_child(life)

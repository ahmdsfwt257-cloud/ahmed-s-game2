class_name LevelTileMap extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelManager.ChangeTilemapBounds( GetTilemapBounds() )
	pass # Replace with function body.


func GetTilemapBounds() -> Array[Vector2]:

	var bounds : Array[Vector2] = []

	bounds.append(
		Vector2(get_used_rect().position * tile_set.tile_size) + global_position
	)

	bounds.append(
		Vector2(get_used_rect().end * tile_set.tile_size) + global_position
	)

	return bounds

class_name Tiles
extends TileMapLayer

var tile_levels: Array = [
		Vector2i(0,0),
		Vector2i(1,0),
		Vector2i(2,0),
		Vector2i(3,0),
		Vector2i(4,0),
		Vector2i(5,0),
]

func _ready() -> void:
	demote_tile(Vector2i(0,0))

func demote_tile(coords:Vector2i) -> void:
	var level:int = tile_levels.find(get_cell_atlas_coords(coords))
	if level == -1:
		print("error, invalid level of tile at ", coords)
		return
	if level == 0:
		erase_cell(coords)
		return
	set_cell(coords, 0, tile_levels[level-1])

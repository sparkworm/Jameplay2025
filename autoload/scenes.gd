## Global script meant to hold references to all loadable game scenes, such as levels, the main
## menu, and the credis.
extends Node

enum ID {
	MAIN_MENU,
	L1,
	L2,
	TEST,
	END
}

var scenes: Dictionary = {
	ID.MAIN_MENU : preload("res://scenes/main_menu.tscn"),
	ID.TEST : preload("res://scenes/levels/test_level.tscn"),
	ID.L1 : preload("res://scenes/levels/level_1.tscn"),
	ID.L2 : preload("res://scenes/levels/level_2.tscn"),
	ID.END : preload("res://scenes/credits.tscn")
}

func level_after(current: ID) -> ID:
	#var index = scenes.find_key(current)
	#if index == -1:
		#print("ERROR: ID does not exist")
		#return ID.MAIN_MENU
	if current >= ID.END:
		return ID.MAIN_MENU
	return current + 1

## Global script meant to hold references to all loadable game scenes, such as levels, the main
## menu, and the credis.
extends Node

enum ID {
	MAIN_MENU,
	L1,
	L2,
	TEST,
}

var scenes: Dictionary = {
	#ID.MAIN_MENU : preload()
	ID.TEST : preload("res://scenes/levels/test_level.tscn")
}

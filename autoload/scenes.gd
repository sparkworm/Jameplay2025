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
	#Names.MAIN_MENU : preload()
}

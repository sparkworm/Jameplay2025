extends Node
## Tells Main to switch the active scene to a new one.  Likely called from
## start menu or from completed level.
signal change_scene(new_scene: Scenes.ID)

## Signal emitted when the game should be quit
signal game_quit

extends Node

func _ready():

	if ProjectSettings.get_setting("application/run/Enable Metal Performance HUD") == true:
		OS.set_environment("MTL_HUD_ENABLED", "1")
	else:
		OS.set_environment("MTL_HUD_ENABLED", "0")

	pass

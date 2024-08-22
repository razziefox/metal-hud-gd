@tool
extends EditorPlugin

const autoload_name = "metal_auto"

func _enter_tree():
	
	OS.set_environment("MTL_HUD_ENABLED", "0")
	
	if ProjectSettings.has_setting("application/run/Enable Metal Performance HUD") == false:
			ProjectSettings.set_setting("application/run/Enable Metal Performance HUD", false)

	ProjectSettings.set_restart_if_changed("application/run/Enable Metal Performance HUD", true)
	ProjectSettings.set_initial_value("application/run/Enable Metal Performance HUD", false)
	
	if ProjectSettings.get_setting("application/run/Enable Metal Performance HUD") == true:
		OS.set_environment("MTL_HUD_ENABLED", "1")
		ProjectSettings.set_setting("autoload/metal_auto", "*res://addons/metal_hud/metal_hud_export.gd")
	else:
		remove_autoload_singleton(autoload_name)
		OS.set_environment("MTL_HUD_ENABLED", "0")
		
	pass

func _exit_tree():

	OS.set_environment("MTL_HUD_ENABLED", "0")
	remove_autoload_singleton(autoload_name)

	pass

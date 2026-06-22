@tool
extends EditorPlugin

func _enable_plugin() -> void:
	add_autoload_singleton("Notifications", "res://addons/notification_system_lite/notification_system.gd")

func _disable_plugin() -> void:
	remove_autoload_singleton("Notifications")

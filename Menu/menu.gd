extends Control

func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://Mundo/mundito.tscn")

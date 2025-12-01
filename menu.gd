extends Control

func _on_boton_jugar_pressed():
	# IMPORTANTE: Aquí debes poner el nombre EXACTO de tu escena de juego.
	# Puede ser "Mundo.tscn" o "Mundo_2.tscn". Revisa tus archivos.
	get_tree().change_scene_to_file("res://mundo2.tscn")

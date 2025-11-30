extends Node2D

# 1. Cargamos el molde (Ya confirmamos que esta ruta es la correcta)
var obstaculo_scene = preload("res://obstaculo.tscn")

# 2. Esta función se activa AUTOMÁTICAMENTE cada 1.5 segundos por el Timer
func _on_timer_timeout():
	# Crear una copia del obstáculo
	var nuevo_obstaculo = obstaculo_scene.instantiate()
	
	# Decidir posición aleatoria en X (carriles)
	var x_random = randf_range(50, 550)
	
	# Ponerlo arriba (-50) para que baje entrando a la pantalla
	nuevo_obstaculo.position = Vector2(x_random, -50)
	
	# Asegurar que se dibuje ENCIMA de la carretera (Z-Index alto)
	nuevo_obstaculo.z_index = 10
	
	# Agregarlo al juego
	add_child(nuevo_obstaculo)

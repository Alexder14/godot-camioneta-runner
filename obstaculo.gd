extends Area2D

# Velocidad de caída
const VELOCIDAD = 300.0

# FUNCIÓN 1: MOVIMIENTO (Lo que ya tenías)
func _process(delta):
	position.y += VELOCIDAD * delta
	
	# Borrar si sale de la pantalla
	if position.y > 800:
		queue_free()

# FUNCIÓN 2: DETECTAR CHOQUE (¡ESTA FALTABA!)
# Esta es la que detiene el juego.
func _on_body_entered(body):
	if body.name == "Jugador":
		print("💥 ¡CHOCASTE!")
		
		# En lugar de pausar aquí, llamamos al Jefe (Mundo)
		# get_parent() obtiene el nodo Mundo
		get_parent().game_over()

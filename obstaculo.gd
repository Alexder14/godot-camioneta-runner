extends Area2D

# Velocidad de caída (igual que la carretera para que se vea natural)
const VELOCIDAD = 300.0

func _process(delta):
	# Mover hacia abajo
	position.y += VELOCIDAD * delta
	
	# Si baja mucho (800px), lo borramos para liberar memoria
	if position.y > 800:
		queue_free()

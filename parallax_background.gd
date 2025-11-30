extends ParallaxBackground

# Velocidad de la carretera
const VELOCIDAD = 300.0

func _process(delta):
	# Movemos el fondo hacia abajo
	scroll_offset.y += VELOCIDAD * delta

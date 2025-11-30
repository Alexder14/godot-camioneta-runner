extends ParallaxBackground

# Velocidad de la carretera
const VELOCIDAD = 300.0

func _process(delta):
	# AHORA USAMOS LA VELOCIDAD DEL GLOBAL
	scroll_offset.y += Global.velocidad * delta

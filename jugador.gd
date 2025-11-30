extends CharacterBody2D

const VELOCIDAD = 400.0
# Variable para el tamaño de la pantalla
var pantalla

func _ready():
	# 1. Medimos la pantalla
	pantalla = get_viewport_rect().size
	# 2. (Opcional) Si quieres que el código lo centre automáticamente, descomenta estas lineas:
	# position.x = pantalla.x / 2
	# position.y = pantalla.y - 100

func _physics_process(delta):
	# Empezamos quietos
	velocity.x = 0

	# Si tocas Flecha Derecha -> Mover a la derecha
	if Input.is_action_pressed("ui_right"):
		velocity.x = VELOCIDAD
	
	# Si tocas Flecha Izquierda -> Mover a la izquierda
	if Input.is_action_pressed("ui_left"):
		velocity.x = -VELOCIDAD

	# Aplicar movimiento
	move_and_slide()

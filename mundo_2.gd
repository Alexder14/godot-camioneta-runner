extends Node2D

# Cargamos el molde del obstáculo
var obstaculo_scene = preload("res://obstaculo.tscn")
var score = 0.0

func _process(delta):
	# 1. Aumentar puntaje (metros recorridos)
	score += 100 * delta
	# Actualizar texto en pantalla
	$CanvasLayer/ScoreLabel.text = "Metros: " + str(int(score))

func _on_timer_timeout():
	var nuevo_obstaculo = obstaculo_scene.instantiate()
	
	# --- AJUSTE PARA PANTALLA VERTICAL (600px) ---
	# La pantalla mide 600 de ancho.
	# Dejamos 50px de margen a los lados para que no queden cortados.
	var x_random = randf_range(50, 550) 
	# ---------------------------------------------
	
	nuevo_obstaculo.position = Vector2(x_random, -50)
	nuevo_obstaculo.z_index = 10
	add_child(nuevo_obstaculo)

func game_over():
	print("💀 MUNDO: Game Over recibido.")
	
	# Mostrar botón de reinicio
	$CanvasLayer/RestartButton.visible = true
	
	# --- AUDIO (Si ya agregaste los nodos del Día 6) ---
	# Si te da error aquí, es porque no has creado los nodos de audio todavía.
	# Puedes borrar estas dos líneas si aún no tienes audio.
	if has_node("MusicaFondo"):
		$MusicaFondo.stop()
	if has_node("SonidoChoque"):
		$SonidoChoque.play()
	# ---------------------------------------------------
	
	# Pausar el juego
	get_tree().paused = true

func _on_restart_button_pressed():
	# Quitar pausa y reiniciar
	get_tree().paused = false
	get_tree().reload_current_scene()

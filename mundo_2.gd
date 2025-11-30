extends Node2D

var obstaculo_scene = preload("res://obstaculo.tscn")
var score = 0.0

func _process(delta):
	# 1. PUNTAJE
	score += Global.velocidad * delta * 0.1
	$CanvasLayer/ScoreLabel.text = "Metros: " + str(int(score))
	
	# 2. ACELERACIÓN AGRESIVA (DÍA 7 MEJORADO)
	# Antes era 5.0. Ahora le ponemos 15.0.
	# ¡Esto hará que cada 10 segundos el juego sea visiblemente más rápido!
	Global.velocidad += 15.0 * delta
	
	# 3. SPAWNER DINÁMICO (¡NUEVO!)
	# Matemáticas simples: Si vas al doble de velocidad, los obstáculos salen el doble de rápido.
	# 300.0 es la velocidad base. 1.5 es el tiempo base.
	var nuevo_tiempo = 1.5 * (300.0 / Global.velocidad)
	
	# Nunca dejar que baje de 0.5 segundos (para que no sea imposible)
	$Timer.wait_time = clamp(nuevo_tiempo, 0.5, 1.5)

func _on_timer_timeout():
	var nuevo_obstaculo = obstaculo_scene.instantiate()
	
	# Rango para pantalla vertical
	var x_random = randf_range(20, 550) 
	
	nuevo_obstaculo.position = Vector2(x_random, -50)
	nuevo_obstaculo.z_index = 10
	add_child(nuevo_obstaculo)

func game_over():
	print("💀 MUNDO: Game Over")
	$CanvasLayer/RestartButton.visible = true
	
	if has_node("MusicaFondo"):
		$MusicaFondo.stop()
	if has_node("SonidoChoque"):
		$SonidoChoque.play()
	
	get_tree().paused = true

func _on_restart_button_pressed():
	Global.reset()
	get_tree().paused = false
	get_tree().reload_current_scene()

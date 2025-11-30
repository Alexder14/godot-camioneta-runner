extends Node2D

var obstaculo_scene = preload("res://obstaculo.tscn")
var score = 0.0

func _process(delta):
	# 1. Aumentar el puntaje (simulamos metros recorridos)
	score += 100 * delta # 100 metros por segundo
	
	# 2. Actualizar el texto en pantalla
	# $CanvasLayer/ScoreLabel busca el nodo automáticamente
	$CanvasLayer/ScoreLabel.text = "Metros: " + str(int(score))

func _on_timer_timeout():
	var nuevo = obstaculo_scene.instantiate()
	nuevo.position = Vector2(randf_range(50, 550), -50)
	nuevo.z_index = 10
	add_child(nuevo)

# --- FUNCIÓN NUEVA: GAME OVER ---
# Esta función la llamará el obstáculo cuando choques
func game_over():
	print("💀 MUNDO: Game Over recibido.")
	
	# 1. Mostrar el botón de reinicio
	$CanvasLayer/RestartButton.visible = true
	
	# 2. Pausar el juego
	get_tree().paused = true

# --- FUNCIÓN NUEVA: REINICIAR ---
# Esta función se activará al presionar el botón
func _on_restart_button_pressed():
	# 1. Quitar la pausa
	get_tree().paused = false
	
	# 2. Recargar la escena actual (F5 automático)
	get_tree().reload_current_scene()

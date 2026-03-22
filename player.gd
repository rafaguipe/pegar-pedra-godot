extends CharacterBody2D

const SPEED = 200

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	velocity = direction.normalized() * SPEED
	move_and_slide()

	limitar_tela()

func limitar_tela():
	var tela = get_viewport_rect().size
	var margem = 32  # metade do tamanho do player

	position.x = clamp(position.x, margem, tela.x - margem)
	position.y = clamp(position.y, margem, tela.y - margem)

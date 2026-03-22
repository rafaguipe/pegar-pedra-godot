extends Node2D

var score = 0

func _ready():
	randomize()
	print("Posicao do alvo:", $Alvo.position)
	mover_alvo()
	atualizar_score()
	mostrar_tudo()

func _on_alvo_body_entered(body):
	score += 1
	atualizar_score()
	print("Pontos: ", score)
	mover_alvo()

func mover_alvo():
	var space = get_world_2d().direct_space_state
	var nova_pos
	var encontrou = false
	
	while not encontrou:
		nova_pos = Vector2(
			randi() % 800,
			randi() % 600
		)
		
		var query = PhysicsPointQueryParameters2D.new()
		query.position = nova_pos
		query.collide_with_areas = true
		query.collide_with_bodies = true
		
		var result = space.intersect_point(query)
		
		if result.size() == 0:
			encontrou = true
	
	$Alvo.position = nova_pos

func atualizar_score():
	$CanvasLayer/ScoreLabel.text = "Pontos: " + str(score)

func mostrar_tudo():
	$Player.visible = true
	$Alvo.visible = true

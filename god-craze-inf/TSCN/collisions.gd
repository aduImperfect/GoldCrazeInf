extends Node2D

@export var playerNode : Node2D
@export var coinNode : Node2D
@export var wallCollectionNode : Node2D
@export var enemyCollectionNode : Node2D

@export var deltaPos : float = 20

@export var xLower : bool = false
@export var xUpper : bool = false
@export var yLower : bool = false
@export var yUpper : bool = false

@export var wallTouched : bool = false

#@export var collisionsReset : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_player_to_coin()
	_player_to_wall()
	_player_to_enemies()
	_enemies_to_wall()

func _player_to_coin() -> void:
	if (playerNode.position.x >= (coinNode.position.x - deltaPos)):
		xLower = true
	else:
		xLower = false

	if (playerNode.position.x <= (coinNode.position.x + deltaPos)):
		xUpper = true
	else:
		xUpper = false

	if (playerNode.position.y >= (coinNode.position.y - deltaPos)):
		yLower = true
	else:
		yLower = false

	if (playerNode.position.y <= (coinNode.position.y + deltaPos)):
		yUpper = true
	else:
		yUpper = false

	if xLower == true && xUpper == true && yLower == true && yUpper == true:
		coinNode.coinTouched = true
	else:
		coinNode.coinTouched = false

func _player_to_wall() -> void:

	var xWallLower : bool = false
	var xWallUpper : bool = false
	var yWallLower : bool = false
	var yWallUpper : bool = false

	for i in wallCollectionNode.wallCount:
		if (playerNode.position.x >= (wallCollectionNode.wallNodes[i].position.x - deltaPos)):
			xWallLower = true
		else:
			xWallLower = false

		if (playerNode.position.x <= (wallCollectionNode.wallNodes[i].position.x + deltaPos)):
			xWallUpper = true
		else:
			xWallUpper = false

		if (playerNode.position.y >= (wallCollectionNode.wallNodes[i].position.y - deltaPos)):
			yWallLower = true
		else:
			yWallLower = false

		if (playerNode.position.y <= (wallCollectionNode.wallNodes[i].position.y + deltaPos)):
			yWallUpper = true
		else:
			yWallUpper = false

		if xWallLower == true && xWallUpper == true && yWallLower == true && yWallUpper == true:

			if playerNode.movingLeft == true:
				playerNode.movingLeft = false
				playerNode.movingRight = true
				playerNode.position.x += 20

			elif playerNode.movingRight == true:
				playerNode.movingRight = false
				playerNode.movingLeft = true
				playerNode.position.x -= 20

			elif playerNode.movingUp == true:
				playerNode.movingUp = false
				playerNode.movingDown = true
				playerNode.position.y += 20

			elif playerNode.movingDown == true:
				playerNode.movingDown = false
				playerNode.movingUp = true
				playerNode.position.y -= 20

func _player_to_enemies() -> void:

	var xEnemyLower : bool = false
	var xEnemyUpper : bool = false
	var yEnemyLower : bool = false
	var yEnemyUpper : bool = false

	for i in enemyCollectionNode.enemyCount:
		if enemyCollectionNode.enemyEnabled[i] == true:
			if (playerNode.position.x >= (enemyCollectionNode.enemyNodes[i].position.x - deltaPos)):
				xEnemyLower = true
			else:
				xEnemyLower = false

			if (playerNode.position.x <= (enemyCollectionNode.enemyNodes[i].position.x + deltaPos)):
				xEnemyUpper = true
			else:
				xEnemyUpper = false

			if (playerNode.position.y >= (enemyCollectionNode.enemyNodes[i].position.y - deltaPos)):
				yEnemyLower = true
			else:
				yEnemyLower = false

			if (playerNode.position.y <= (enemyCollectionNode.enemyNodes[i].position.y + deltaPos)):
				yEnemyUpper = true
			else:
				yEnemyUpper = false

			if xEnemyLower == true && xEnemyUpper == true && yEnemyLower == true && yEnemyUpper == true:
				playerNode._player_reset()
				enemyCollectionNode._enemies_reset()
				coinNode._coin_reset()
				break

func _enemies_to_wall() -> void:
	for j in enemyCollectionNode.enemyCount:
		_enemy_to_wall(j)

func _enemy_to_wall(_i : int) -> void:

	var xWallLower : bool = false
	var xWallUpper : bool = false
	var yWallLower : bool = false
	var yWallUpper : bool = false

	for k in wallCollectionNode.wallCount:
		if (enemyCollectionNode.enemyNodes[_i].position.x >= (wallCollectionNode.wallNodes[k].position.x - deltaPos)):
			xWallLower = true
		else:
			xWallLower = false

		if (enemyCollectionNode.enemyNodes[_i].position.x <= (wallCollectionNode.wallNodes[k].position.x + deltaPos)):
			xWallUpper = true
		else:
			xWallUpper = false

		if (enemyCollectionNode.enemyNodes[_i].position.y >= (wallCollectionNode.wallNodes[k].position.y - deltaPos)):
			yWallLower = true
		else:
			yWallLower = false

		if (enemyCollectionNode.enemyNodes[_i].position.y <= (wallCollectionNode.wallNodes[k].position.y + deltaPos)):
			yWallUpper = true
		else:
			yWallUpper = false

		if xWallLower == true && xWallUpper == true && yWallLower == true && yWallUpper == true:

			if enemyCollectionNode.enemyMovingLeft[_i] == true:
				enemyCollectionNode.enemyMovingLeft[_i] = false
				enemyCollectionNode.enemyMovingRight[_i] = true

			elif enemyCollectionNode.enemyMovingRight[_i] == true:
				enemyCollectionNode.enemyMovingRight[_i] = false
				enemyCollectionNode.enemyMovingLeft[_i] = true

			elif enemyCollectionNode.enemyMovingUp[_i] == true:
				enemyCollectionNode.enemyMovingUp[_i] = false
				enemyCollectionNode.enemyMovingDown[_i] = true

			elif enemyCollectionNode.enemyMovingDown[_i] == true:
				enemyCollectionNode.enemyMovingDown[_i] = false
				enemyCollectionNode.enemyMovingUp[_i] = true

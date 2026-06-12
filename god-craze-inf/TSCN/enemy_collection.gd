extends Node2D

const ENEMY_SCENE = preload("res://TSCN/enemy.tscn")

@export var coinNode : Node2D

@export var speed : float = 100.0

@export var invisiblePosX : float = -99999.0
@export var invisiblePosY : float = -99999.0
@export var delaySeconds : float = 3.0

@export var enemyNodes : Array[Node2D] = []
@export var enemyEnabled : Array[bool] = []
@export var enemyAccumulatedDelta : Array[float] = [0.0]
@export var enemyCount : int = 0
@export var enemyDirRandmizer : int = 0

@export var enemyMovingLeft : Array[bool] = []
@export var enemyMovingRight : Array[bool] = []
@export var enemyMovingUp : Array[bool] = []
@export var enemyMovingDown : Array[bool] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if coinNode.coinTouched == true:
		_spawn_enemy()

	_enable_enemies(_delta)
	_move_enemies(_delta)

func _spawn_enemy() -> void:

	enemyCount += 1
	var enemy_instance = ENEMY_SCENE.instantiate()
	enemy_instance.global_position.x = coinNode.coinPosX
	enemy_instance.global_position.y = coinNode.coinPosY

	add_child(enemy_instance)
	enemyNodes.append(enemy_instance)
	enemyEnabled.append(false)
	enemyAccumulatedDelta.append(0.0)
	
	enemyDirRandmizer = randi_range(0,3)

	if enemyDirRandmizer == 0:
		enemyMovingLeft.append(true)
	else:
		enemyMovingLeft.append(false)

	if enemyDirRandmizer == 1:
		enemyMovingRight.append(true)
	else:
		enemyMovingRight.append(false)

	if enemyDirRandmizer == 2:
		enemyMovingUp.append(true)
	else:
		enemyMovingUp.append(false)

	if enemyDirRandmizer == 3:
		enemyMovingDown.append(true)
	else:
		enemyMovingDown.append(false)

func _enable_enemies(_delta : float) -> void:

	for k in enemyCount:
		if enemyAccumulatedDelta[k] > delaySeconds:
			enemyNodes[k].modulate.a = 1
			enemyEnabled[k] = true
		else:
			enemyNodes[k].modulate.a += _delta * 0.1
			enemyAccumulatedDelta[k] += _delta

func _move_enemies(_delta : float) -> void :
	for i in enemyCount:
		if enemyMovingLeft[i] == true :
			enemyNodes[i].position.x += -1 * speed * _delta
			enemyNodes[i].rotation_degrees = 270

		if enemyMovingRight[i] == true :
			enemyNodes[i].position.x += speed * _delta
			enemyNodes[i].rotation_degrees = 90

		if enemyMovingUp[i] == true :
			enemyNodes[i].position.y += -1 * speed * _delta
			enemyNodes[i].rotation_degrees = 0

		if enemyMovingDown[i] == true :
			enemyNodes[i].position.y += speed * _delta
			enemyNodes[i].rotation_degrees = 180

func _enemies_reset() -> void:
	
	for k in enemyCount:
		enemyNodes[k].position.x = invisiblePosX
		enemyNodes[k].position.y = invisiblePosY
		enemyEnabled[k] = false
		enemyAccumulatedDelta[k] = 0.0

	enemyNodes.clear()
	enemyEnabled.clear()
	enemyAccumulatedDelta.clear()
	enemyCount = 0

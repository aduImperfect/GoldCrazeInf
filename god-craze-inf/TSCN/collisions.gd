extends Node2D

@export var playerNode : Node2D
@export var coinNode : Node2D

@export var deltaPos : float = 20

@export var xLower : bool = false
@export var xUpper : bool = false
@export var yLower : bool = false
@export var yUpper : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

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

	print("Player Pos (Collision Script)")
	print(playerNode.position)

	print("Coin Pos (Collision Script)")
	print(coinNode.position)

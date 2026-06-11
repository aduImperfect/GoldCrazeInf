extends Sprite2D

var invisibleCoinPosX : float = -999999.0
var invisibleCoinPosY : float = -999999.0
var coinPosX : float = -999999.0
var coinPosY : float = -999999.0
@export var spawnCoin : bool = true
@export var coinTouched : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	if spawnCoin == true:
		coinPosX = randi_range(250, 750)
		coinPosY = randi_range(150, 450)
		spawnCoin = false
		coinTouched = false

	if spawnCoin == false:
		if coinTouched == true:
			coinPosX = invisibleCoinPosX
			coinPosY = invisibleCoinPosY
			spawnCoin = true

	position.x = coinPosX
	position.y = coinPosY

	print("Coin Pos")
	print(position)

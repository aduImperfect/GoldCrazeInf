extends Sprite2D

@export var invisibleCoinPosX : float = -999999.0
@export var invisibleCoinPosY : float = -999999.0
@export var coinPosX : float = -999999.0
@export var coinPosY : float = -999999.0
@export var spawnCoin : bool = true
@export var coinTouched : bool = false
@export var coinCount : int = 0
@export var lastCoinCount : int = 0

#@export var coinEnemyAdded : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	if spawnCoin == true:
		coinPosX = randi_range(240, 960)
		coinPosY = randi_range(80, 560)
		spawnCoin = false
		coinTouched = false

	if spawnCoin == false:
		if coinTouched == true:
			coinCount += 1
			coinPosX = invisibleCoinPosX
			coinPosY = invisibleCoinPosY
			spawnCoin = true

	position.x = coinPosX
	position.y = coinPosY

func _coin_reset() -> void:
	lastCoinCount = coinCount
	coinCount = 0

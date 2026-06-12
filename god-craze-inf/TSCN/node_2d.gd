extends Node2D

@export var speed : float = 100.0

@export var startingPosX : float = 550.0
@export var startingPosY : float = 350.0

@export var movingLeft : bool = false
@export var movingRight : bool = false
@export var movingUp : bool = false
@export var movingDown : bool = false

@export var playerDied : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:

	modulate = Color(0.0, 0.0, 2.0, 0.5)

	if Input.is_key_pressed(KEY_LEFT):
		movingLeft = true
		movingRight = false
		movingUp = false
		movingDown = false

	if Input.is_key_pressed(KEY_RIGHT):
		movingLeft = false
		movingRight = true
		movingUp = false
		movingDown = false

	if Input.is_key_pressed(KEY_UP):
		movingLeft = false
		movingRight = false
		movingUp = true
		movingDown = false

	if Input.is_key_pressed(KEY_DOWN):
		movingLeft = false
		movingRight = false
		movingUp = false
		movingDown = true

	if movingLeft == true :
		position.x += -1 * speed * _delta
		rotation_degrees = 270

	if movingRight == true :
		position.x += speed * _delta
		rotation_degrees = 90

	if movingUp == true :
		position.y += -1 * speed * _delta
		rotation_degrees = 0

	if movingDown == true :
		position.y += speed * _delta
		rotation_degrees = 180

func _player_reset() -> void:
	position.x = startingPosX
	position.y = startingPosY
	movingLeft = false
	movingRight = false
	movingUp = false
	movingDown = false

	

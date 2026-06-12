extends Node2D

const WALL_SCENE = preload("res://TSCN/wall.tscn")

@export var wallPosX = 200
@export var wallPosY = 40

@export var wallNodes : Array[Node2D] = []
@export var wallCount : int = 0

@export var xLimit : int = 20
@export var yLimit : int = 15

@export var xCount : int = 1
@export var yCount : int = 1

@export var offset : int = 40

@export var dirRight = true
@export var dirDown = false
@export var dirLeft = false
@export var dirUp = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (wallCount < (xLimit + yLimit + (xLimit - 2) + (yLimit - 2))) :
		_spawn_wall()

func _spawn_wall() -> void:

	wallCount += 1
	var wall_instance = WALL_SCENE.instantiate()
	wall_instance.global_position.x = wallPosX
	wall_instance.global_position.y = wallPosY

	add_child(wall_instance)
	wallNodes.append(wall_instance)

	if dirRight == true:
		if xCount < xLimit :
			wallPosX += offset
			xCount += 1
		else:
			xCount = 1
			dirRight = false
			dirDown = true
	
	if dirDown == true:
		if yCount < yLimit :
			wallPosY += offset
			yCount += 1
		else:
			yCount = 1
			dirDown = false
			dirLeft = true
	
	if dirLeft == true:
		if xCount < xLimit :
			wallPosX -= offset
			xCount += 1
		else:
			xCount = 1
			dirLeft = false
			dirUp = true

	if dirUp == true:
		if yCount < yLimit :
			wallPosY -= offset
			yCount += 1
		else:
			yCount = 1
			dirUp = false

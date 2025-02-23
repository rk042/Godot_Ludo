extends Node

@export var Pieces: Array[Node]
@export var PlayerFirstPosition:int

func _ready() -> void:
	for i in range(0,Pieces.size()):
		Pieces[i].SetCurrentPosition(PlayerFirstPosition)
		pass
	pass

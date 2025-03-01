class_name PlayerPiecesGroup

extends Node2D

@export var Pieces: Array[Piece]
@export var PlayerFirstPosition:int

func _ready() -> void:
	for i in range(0,Pieces.size()):
		Pieces[i].SetCurrentPosition(PlayerFirstPosition)
		pass
	pass

func GetPieceByIndex(index:int)->Piece:
	if(index>=4):
		return null
		pass
	
	return Pieces[index]
	pass

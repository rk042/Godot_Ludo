extends Node

@export var BluePieces : Array[Node]
@export var YelloPieces : Array[Node]
@export var GreenPieces : Array[Node]
@export var RedPieces : Array[Node]

func GetMovePiece(index: int)-> Node:
	var moveThisPiece = GreenPieces[index]
	return moveThisPiece
	
	pass

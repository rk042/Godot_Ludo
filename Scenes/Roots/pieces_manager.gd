extends Node

@export var BluePieces : Array[Node]
@export var YelloPieces : Array[Node]
@export var GreenPieces : Array[Node]
@export var RedPieces : Array[Node]

func GetMovePiece(index: int,playerIndex: int)-> Node:
	var moveThisPiece:Node
	
	match playerIndex:
		0:
			moveThisPiece = GreenPieces[index]
			pass
		1:
			moveThisPiece = YelloPieces[index]
			pass
		2: 
			moveThisPiece = BluePieces[index]
			pass
		3: 
			moveThisPiece = RedPieces[index]
			pass
		pass
	
	return moveThisPiece
	pass

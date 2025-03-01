class_name PiecesManager
extends Node2D

@export var BluePieces : PlayerPiecesGroup
@export var YellowPieces : PlayerPiecesGroup
@export var GreenPieces : PlayerPiecesGroup
@export var RedPieces : PlayerPiecesGroup

func GetMovePiece(index: int,playerIndex: int)-> Piece:
	var moveThisPiece:Piece
	
	match playerIndex:
		0:
			moveThisPiece = GreenPieces.GetPieceByIndex(index)
			pass
		1:
			moveThisPiece = YellowPieces.GetPieceByIndex(index)
			pass
		2: 
			moveThisPiece = BluePieces.GetPieceByIndex(index)
			pass
		3: 
			moveThisPiece = RedPieces.GetPieceByIndex(index)
			pass
		pass
	
	return moveThisPiece
	pass

func HasThisPlayerUnlockedTurn()-> bool:
	var returnValue : bool = false
	

	return returnValue
	pass

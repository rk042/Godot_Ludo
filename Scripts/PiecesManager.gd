class_name PiecesManager
extends Node2D

@export var BluePieces : PlayerPiecesGroup
@export var YellowPieces : PlayerPiecesGroup
@export var GreenPieces : PlayerPiecesGroup
@export var RedPieces : PlayerPiecesGroup

func HasThisPlayerUnlockedTurn()-> bool:
	var returnValue : bool = false
	return returnValue

func PlayAnimationByPlayerIndex(index:int)->void:
	
	match index:
		0:
			GreenPieces.PlayAllPieceAnimation()
			pass
		1:
			YellowPieces.PlayAllPieceAnimation()
			pass
		2:
			BluePieces.PlayAllPieceAnimation()
			pass
		3:
			RedPieces.PlayAllPieceAnimation()
			pass
	pass

func StopAnimation()->void:
	GreenPieces.StopAllPieceAnimation()
	YellowPieces.StopAllPieceAnimation()
	BluePieces.StopAllPieceAnimation()
	RedPieces.StopAllPieceAnimation()
	pass
#func GetMovePiece(index: int,playerIndex: int)-> Piece:
	#var moveThisPiece:Piece
	#
	#match playerIndex:
		#0:
			#moveThisPiece = GreenPieces.GetPieceByIndex(index)
			#pass
		#1:
			#moveThisPiece = YellowPieces.GetPieceByIndex(index)
			#pass
		#2: 
			#moveThisPiece = BluePieces.GetPieceByIndex(index)
			#pass
		#3: 
			#moveThisPiece = RedPieces.GetPieceByIndex(index)
			#pass
		#pass
	#
	#return moveThisPiece
	#pass

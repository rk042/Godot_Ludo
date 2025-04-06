class_name PiecesManager
extends Node2D

@export var BluePieces : PlayerPiecesGroup
@export var YellowPieces : PlayerPiecesGroup
@export var GreenPieces : PlayerPiecesGroup
@export var RedPieces : PlayerPiecesGroup


func HasThisPlayerUnlockedTurn(playerColor:GameManager.PlayerColor)-> bool:
	match playerColor:
		GameManager.PlayerColor.Green:
			return GreenPieces.HasUnlockedAnyPiece()
		GameManager.PlayerColor.Yellow:
			return YellowPieces.HasUnlockedAnyPiece()
		GameManager.PlayerColor.Blue:
			return BluePieces.HasUnlockedAnyPiece()
		GameManager.PlayerColor.Red:
			return RedPieces.HasUnlockedAnyPiece()

	return false

func PlayAnimationByPlayerIndex(playerColor:GameManager.PlayerColor)->void:
	
	match playerColor:
		GameManager.PlayerColor.Green:
			GreenPieces.PlayAllPieceAnimation()
			pass
		GameManager.PlayerColor.Yellow:
			YellowPieces.PlayAllPieceAnimation()
			pass
		GameManager.PlayerColor.Blue:
			BluePieces.PlayAllPieceAnimation()
			pass
		GameManager.PlayerColor.Red:
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

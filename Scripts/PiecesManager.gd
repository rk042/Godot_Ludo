class_name PiecesManager
extends Node2D

@export var BluePieces : PlayerPiecesGroup
@export var YellowPieces : PlayerPiecesGroup
@export var GreenPieces : PlayerPiecesGroup
@export var RedPieces : PlayerPiecesGroup
	
func IsGameOver()->bool:
	
	if BluePieces.HasThisPlayerCompleted() == false:
		return false
	elif YellowPieces.HasThisPlayerCompleted() == false:
		return false
	elif GreenPieces.HasThisPlayerCompleted() == false:
		return false
	elif  RedPieces.HasThisPlayerCompleted() == false:
		return false
		
	return true

func GetPieceGroupBasedOnType(playerColor:GameManager.PlayerColor)->PlayerPiecesGroup:
	match playerColor:
		GameManager.PlayerColor.Green:
			return GreenPieces
		GameManager.PlayerColor.Yellow:
			return YellowPieces
		GameManager.PlayerColor.Blue:
			return BluePieces
		GameManager.PlayerColor.Red:
			return RedPieces
		_:
			return null
		


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

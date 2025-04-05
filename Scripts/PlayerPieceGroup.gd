class_name PlayerPiecesGroup

extends Node2D

@export var Pieces: Array[Piece]
@export var PlayerFirstPosition:int

func _ready() -> void:
	for i in range(0,Pieces.size()):
		Pieces[i].SetStartPosition(PlayerFirstPosition)
		Pieces[i].CurrentState = GameManager.PieceStateEnum.InLobby
		pass
	pass

func GetPieceByIndex(index:int)->Piece:
	if(index>=4):
		return null
		pass
	
	return Pieces[index]
	pass

func HasUnlockedAnyPiece()->bool:
	for piece in Pieces:
		if(piece.CurrentState != GameManager.PieceStateEnum.InLobby):
			return true
	return false

func PlayAllPieceAnimation()->void:
	for i in range(0,Pieces.size()):
		if(Pieces[i].CurrentState!=GameManager.PieceStateEnum.InHouse):
			Pieces[i].PlayAnimation()
			pass
		pass
	pass
func StopAllPieceAnimation()->void:
	for i in range(0,Pieces.size()):
		Pieces[i].StopAnimation()
		pass
	pass

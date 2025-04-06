class_name Piece

extends Node2D

var CurrentPosition: int = 0
var CurrentState:GameManager.PieceStateEnum = GameManager.PieceStateEnum.InLobby
var StartingPosition: int = 0
var wayPointManager:WayPointsManager 

@export var CurrentPlayerColor:GameManager.PlayerColor
@export var PieceSprite: Sprite2D
@export var animation_PieceSelect: AnimationPlayer

func _ready() -> void:
	wayPointManager = get_tree().get_first_node_in_group("WayPointManagerGroup")
	pass

func SetStartPosition(index: int)->void:
	CurrentPosition = index
	StartingPosition = index
	pass

func SetCurrentPositionAndCheckKill(index: int)->void:
	CurrentPosition = index
	wayPointManager.SetPieceToThisWayPoint(index,self)
	pass
	
func GetCurrentPosition()->int:
	return CurrentPosition

func HasThisPlayerUnlockedPiece()->bool:
	return CurrentState == GameManager.PieceStateEnum.InLobby

func _input(event: InputEvent) -> void:
	#wait for player dice to roll
	if(GameManager.GameCurrentState == GameManager.GameStateEnum.PlayerSelectPiece):
		var playerClick = event.is_action_pressed("PlayerClick")
		var isClickedOnSprite = PieceSprite.is_pixel_opaque(PieceSprite.get_local_mouse_position())
	
		if(playerClick && isClickedOnSprite):
			#print("player has selected ",self.name,"piece")
			GameManager.OnPlayerSelectPiece.emit(self)
			pass
		pass
	pass

func AIInput()->void:
	GameManager.OnPlayerSelectPiece.emit(self)
	pass

func PlayAnimation()-> void:
	if(CurrentState != GameManager.PieceStateEnum.InHouse):
		animation_PieceSelect.play("PieceAnimation_Select")
		pass
	pass
func StopAnimation()-> void:
	animation_PieceSelect.stop()
	pass

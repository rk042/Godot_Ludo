class_name Piece

extends Node2D

var CurrentPosition: int = 0
var CurrentState:GameManager.PieceStateEnum = GameManager.PieceStateEnum.InLobby

@export var CurrentPlayerColor:GameManager.PlayerColor
@export var PieceSprite: Sprite2D
@export var animation_PieceSelect: AnimationPlayer

func SetStartPosition(index: int)->void:
	CurrentPosition = index
	pass

func SetCurrentPosition(index: int)->void:
	CurrentPosition = index
	var wayPointManager:WayPointsManager = get_tree().get_first_node_in_group("WayPointManagerGroup")
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

func PlayAnimation()-> void:
	if(CurrentState != GameManager.PieceStateEnum.InHouse):
		animation_PieceSelect.play("PieceAnimation_Select")
		pass
	pass
func StopAnimation()-> void:
	animation_PieceSelect.stop()
	pass

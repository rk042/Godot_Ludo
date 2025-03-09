class_name Piece

extends Node2D

var CurrentPosition: int = 0
@export var PieceSprite: Sprite2D
@export var animation_PieceSelect: AnimationPlayer
@export var isAtHome:bool = false

func SetCurrentPosition(value: int)->void:
	CurrentPosition = value
	pass
	
func GetCurrentPosition()->int:
	return CurrentPosition

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
	if(!isAtHome):
		animation_PieceSelect.play("PieceAnimation_Select")
		pass
	pass
func StopAnimation()-> void:
	animation_PieceSelect.stop()
	pass

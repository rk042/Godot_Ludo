class_name BoardManager

extends Node2D

@export var way_points: WayPointsManager
@export var piecesManager: PiecesManager
@export var animation_PlayerForPlaces: AnimationPlayer

var currentPlayerTurnIndex:int = -1
var currentDiceValue:int = -1
var currentAnimationPlaceName:String = ""
var hasKill:bool = false
var currentPlayerColor:GameManager.PlayerColor

signal OnHasKill

func _ready() -> void:
	UpdatePlayerTurn()
	GameManager.OnPlayerSelectPiece.connect(_on_player_select_piece)
	pass

func _on_player_select_piece(value:Piece) ->void:
	print(value.get_parent().name)
	
	#stop piece animation after player click on it
	StopPieceAnimation()
	
	var playerType = value.CurrentPlayerColor
	var isPlayerTurn = IsThisPlayerTurn(playerType)
	
	#check is right player turn
	if(isPlayerTurn):
		MovePieces(currentDiceValue,value)
		pass
	else: 
		pass
	pass
	
func IsThisPlayerTurn(playerType:GameManager.PlayerColor)->bool:
	var returnValue:bool = false
	
	match playerType:
		GameManager.PlayerColor.Green:
			returnValue = (currentPlayerTurnIndex == 0)
			pass
		GameManager.PlayerColor.Yellow:
			returnValue = (currentPlayerTurnIndex == 1)
			pass
		GameManager.PlayerColor.Blue:
			returnValue = (currentPlayerTurnIndex == 2)
			pass
		GameManager.PlayerColor.Red:
			returnValue = (currentPlayerTurnIndex == 3)
			pass
	
	return returnValue

func _on_dice_root_on_dice_roll_begin() -> void:
	
	#stop animation because player clicked on dice to start dice animation
	animation_PlayerForPlaces.stop()
	pass # Replace with function body.

func _on_dice_root_on_dice_rolled(value: int) -> void:
	print("diceRolled! Value is ",value)
	currentDiceValue = value
		
	#if this user get 1 to 5 and this user do not have any piece unlocked to move so skip turn
	if(currentDiceValue !=6 && piecesManager.HasThisPlayerUnlockedTurn(currentPlayerTurnIndex) == false):
		print("skip this player turn because this player has not unlocked any piece yet")
		#update turn
		UpdatePlayerTurn()
		
		# change gamecurrent state to player select piece
		GameManager.GameCurrentState = GameManager.GameStateEnum.PlayerCanRollDice
		
		print("Game state ",GameManager.GameCurrentState)
		return

	#play piece animation because player rolled dice
	PlayPieceAnimation()
	pass # Replace with function body.
	
func MovePieces(value: int, moveThisPiece: Piece) -> void:
	
	#store update value based on current position otherwise piece start moving from 0 each time.
	value+=moveThisPiece.GetCurrentPosition()
	
	#update game state other wise use can click on piece or dice and game will brack
	GameManager.GameCurrentState = GameManager.GameStateEnum.Null
	
	#move piece step by step 1 second for 1 step
	for i in range(moveThisPiece.GetCurrentPosition(),value):
		moveThisPiece.position = way_points.GetPositionOfThisPoint(i,currentPlayerColor)
		await get_tree().create_timer(1).timeout
		
	#update current piece value to current position so next time we get frash value which we use in value
	moveThisPiece.SetCurrentPositionAndCheckKill(value)
	
	if (hasKill):
		await OnHasKill
		
	moveThisPiece.CurrentState = GameManager.PieceStateEnum.InWayPoint
	
	#update state so next player can roll dice
	GameManager.GameCurrentState = GameManager.GameStateEnum.PlayerCanRollDice
	
	#update turn
	UpdatePlayerTurn()
	pass



func MovePiecesToHome(value: int, moveThisPiece: Piece) -> void:

	#move piece step by step 1 second for 1 step
	for i in range(moveThisPiece.GetCurrentPosition()-1,value-1,-1):
		moveThisPiece.position = way_points.GetPositionOfThisPoint(i,currentPlayerColor)
		await get_tree().create_timer(0.5).timeout
		
	#update current piece value to current position so next time we get frash value which we use in value
	moveThisPiece.CurrentPosition = value
	moveThisPiece.CurrentState = GameManager.PieceStateEnum.InWayPoint
	
	OnHasKill.emit()
	
	pass




func UpdatePlayerTurn() -> void:
	print("Update player turn......")
	currentPlayerTurnIndex+=1
	
	#if player index increase to 4 reset counter again.
	if(currentPlayerTurnIndex >=4):
		currentPlayerTurnIndex=0
		pass

	match currentPlayerTurnIndex:
		0:
			currentPlayerColor = GameManager.PlayerColor.Green
			pass
		1:
			currentPlayerColor = GameManager.PlayerColor.Yellow
			pass
		2:
			currentPlayerColor = GameManager.PlayerColor.Blue
			pass
		3:
			currentPlayerColor = GameManager.PlayerColor.Red
			pass

	#play place animation to suggest use it's your turn to roll dice
	PlayPlaceAnimation()
	pass

func PlayPlaceAnimation()-> void:
	
	#update animation state for play right player turn place animation
	match(currentPlayerTurnIndex):
		0:
			currentAnimationPlaceName = "GreenPlaceAnimation"
			pass
		1:
			currentAnimationPlaceName = "YellowPlaceAnimation"
			pass
		2: 
			currentAnimationPlaceName = "BluePlaceAnimation"
			pass
		3:
			currentAnimationPlaceName = "RedPlaceAnimation"
			pass
			
	animation_PlayerForPlaces.stop()
	animation_PlayerForPlaces.play(currentAnimationPlaceName)
	pass

func PlayPieceAnimation()-> void:
	piecesManager.PlayAnimationByPlayerIndex(currentPlayerTurnIndex)
	pass

func StopPieceAnimation()-> void:
	piecesManager.StopAnimation()
	pass

func DetectKill(pieceToBeGoHome:Piece)->void:

	if(pieceToBeGoHome == null):
		hasKill=false
	else:
		print("sent ",pieceToBeGoHome.name," to home")
		hasKill = true	
		MovePiecesToHome(pieceToBeGoHome.StartingPosition,pieceToBeGoHome)
	pass

#func AnimateSprite() -> void:
	#for i in range(0,100):
		#yellowPlace.self_modulate = yellowPlace.self_modulate.lerp(Color.BLACK, 1/i*2)
		#await get_tree().get_frame()
		#pass
	#for i in range(0,100):
		#yellowPlace.self_modulate = yellowPlace.self_modulate.lerp(Color.WHITE, 1/i*2)
		#await get_tree().get_tree().get_frame()
		#pass
	#pass

#func GetPieceForMove()-> Piece:
	#var piece = Pieces.GetMovePiece(0,currentPlayerTurnIndex)
	#return piece
# testing code for green piece move a step with 1 second tiemr.
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#for i in range(0,way_points.GetCount()):
		#
		#var _pos = way_points.GetPositionOfThisPoint(i)
		#testPiece.position = _pos
		#
		#await get_tree().create_timer(1).timeout
		#
		#pass
	#
	#pass # Replace with function body.

class_name BoardManager

extends Node2D

@export var way_points: WayPointsManager
@export var Pieces: PiecesManager

var currentPlayerTurnIndex:int = 0
var currentDiceValue = -1

func _ready() -> void:
	GameManager.OnPlayerSelectPiece.connect(_on_player_select_piece)
	pass

func _on_player_select_piece(value:Piece) ->void:
	print(value.name)
	MovePieces(currentDiceValue,value)
	pass

func _on_dice_root_on_dice_rolled(value: int) -> void:
	print("diceRolled! Value is ",value)

	currentDiceValue = value

	#await get_tree().create_timer(1).timeout
	
	#UpdatePlayerTurn()
	#MovePieces(value) 

	pass # Replace with function body.
	
func MovePieces(value: int, moveThisPiece: Piece) -> void:
	value+=moveThisPiece.GetCurrentPosition()
	
	GameManager.GameCurrentState = GameManager.GameStateEnum.Null
	
	for i in range(moveThisPiece.GetCurrentPosition(),value):
		moveThisPiece.position = way_points.GetPositionOfThisPoint(i)
		await get_tree().create_timer(1).timeout
		
	moveThisPiece.SetCurrentPosition(value)
	
	GameManager.GameCurrentState = GameManager.GameStateEnum.PlayerCanRollDice

	pass

func UpdatePlayerTurn() -> void:
	currentPlayerTurnIndex+=1
	
	if(currentPlayerTurnIndex >=4):
		currentPlayerTurnIndex=0
		pass
	pass

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

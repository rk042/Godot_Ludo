extends Node

@export var way_points: Node
@export var Pieces: Node

func _on_dice_root_on_dice_rolled(value: int) -> void:
	print("diceRolled! Value is ",value)
	
	for i in range(0,value):
		var moveThisPiece = Pieces.GetMovePiece(0)
		moveThisPiece.position = way_points.GetPositionOfThisPoint(i)
		await get_tree().create_timer(1).timeout
	
	pass # Replace with function body.


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

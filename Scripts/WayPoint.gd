class_name WayPoint
extends Node2D

@export var isThisSafePlace:bool

var wayPointManager:WayPointsManager
var myHoldings:Array[Piece]

func _ready() -> void:
	wayPointManager = get_tree().get_first_node_in_group("WayPointManagerGroup")
	pass

func SetPiece(piece:Piece)->void:
	print("piece data __ ",piece.name)
	myHoldings.push_back(piece)
	var hasKill = HasWeHaveOpponentPiece()
	if(hasKill):
		print("it is kill")
		pass
	else:
		print("same as turn player")
		pass
	pass

func ClearMe()->void:
	myHoldings.clear()
	pass
	
func HasWeHaveOpponentPiece()->bool: #outPiece:Piece
	if(isThisSafePlace): return false
	if(myHoldings.is_empty()): return false
	if(myHoldings.size()==1): return false
	
	var lastValue = myHoldings[myHoldings.size()-1];
	
	for item:Piece in myHoldings:
		if(item != lastValue):
			#outPiece=item
			return true
		pass
	
	return false

# wait for development progress..

class_name WayPointsManager

extends Node2D

@export var main_path_for_all: Node
@export var green_path: Node
@export var yellow_path: Node
@export var blue_path: Node
@export var red_path: Node

var boardManager:BoardManager

func _ready() -> void:
	boardManager = get_tree().get_first_node_in_group("BoardManager")
	pass

func GetPositionOfThisPoint(index: int)->Vector2:
	var position = Vector2.ZERO
	
	position = main_path_for_all.get_child(index).position
	
	return position
	pass
	
func GetCount() -> int:
	return main_path_for_all.get_child_count()
	pass

func SetPieceToThisWayPoint(index:int, piece:Piece)->void:
	var wayPoint:WayPoint = main_path_for_all.get_child(index);
	wayPoint.SetPiece(piece)
	pass

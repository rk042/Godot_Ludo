class_name WayPointsManager

extends Node2D

@export var green_path: Array[Node]
@export var yellow_path: Array[Node]
@export var blue_path: Array[Node]
@export var red_path: Array[Node]

func GetPositionOfThisPoint(index: int,playerColor:GameManager.PlayerColor)->Vector2:
	var position = Vector2.ZERO
	match playerColor:
		GameManager.PlayerColor.Green:
			position = green_path[index].position
			pass
		GameManager.PlayerColor.Yellow:
			position = yellow_path[index].position
			pass
		GameManager.PlayerColor.Blue:
			position = blue_path[index].position
			pass
		GameManager.PlayerColor.Red:
			position = red_path[index].position
			pass
		pass
	return position
	
func GetCount(playerColor:GameManager.PlayerColor) -> int:
	match playerColor:
		GameManager.PlayerColor.Green:
			return green_path.size()
		GameManager.PlayerColor.Yellow:
			return yellow_path.size()
		GameManager.PlayerColor.Blue:
			return blue_path.size()
		GameManager.PlayerColor.Red:
			return red_path.size()
	return -1

func SetPieceToThisWayPoint(index:int, piece:Piece)->void:
	var wayPoint:WayPoint = null
	match piece.CurrentPlayerColor:
		GameManager.PlayerColor.Green:
			wayPoint = green_path[index];
		GameManager.PlayerColor.Yellow:
			wayPoint = yellow_path[index];
		GameManager.PlayerColor.Blue:
			wayPoint = blue_path[index];
		GameManager.PlayerColor.Red:
			wayPoint = red_path[index];
		pass
	wayPoint.SetPiece(piece)
	pass

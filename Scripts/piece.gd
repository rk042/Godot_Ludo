extends Node2D

var CurrentPosition: int = 0

func SetCurrentPosition(value: int)->void:
	CurrentPosition = value
	pass
	
func GetCurrentPosition()->int:
	return CurrentPosition
	pass

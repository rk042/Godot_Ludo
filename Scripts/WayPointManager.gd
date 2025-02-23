extends Node
@export var main_path_for_all: Node
@export var green_path: Node
@export var yellow_path: Node
@export var blue_path: Node
@export var red_path: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func GetPositionOfThisPoint(index: int)->Vector2:
	var position = Vector2.ZERO
	
	position = main_path_for_all.get_child(index).position
	
	return position
	pass
	
func GetCount() -> int:
	return main_path_for_all.get_child_count()
	pass

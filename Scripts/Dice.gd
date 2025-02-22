extends Node

@onready var Maindice: Sprite2D = $Sprite2D_MainDice
@export var DicesSpriteArray : Array[Texture2D]

func SetSpriteByIndex(index: int) -> void:
	print(index)
	Maindice.texture = DicesSpriteArray[index]
	pass

# ----------------- Testing Code ----------------------------------

#func _ready() -> void:
	#for i in range(0,DicesSpriteArray.size()):
		#await get_tree().create_timer(2).timeout
		#SetSpriteByIndex(i)
		#pass
	#pass
	

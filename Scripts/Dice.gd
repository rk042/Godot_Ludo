extends Node

@export var Maindice: Sprite2D
@export var DicesSpriteArray : Array[Texture2D]

signal OnDiceRolled(value: int)
signal OnDiceAniamtionComplate_Local

func SetSpriteByIndex(index: int) -> void:
	Maindice.texture = DicesSpriteArray[index]
	pass
	
func RollDice() -> void:
	var randomNumber = RandomNumberGenerator.new().randf_range(0,6)
	AnimateDice()
	
	await OnDiceAniamtionComplate_Local;
	
	SetSpriteByIndex(randomNumber)
	randomNumber+=1
	
	OnDiceRolled.emit(randomNumber)
	pass

func _input(event: InputEvent) -> void:
	var diceClicked = event.is_action_pressed("DiceClick")
	var isClickedOnSprite = Maindice.is_pixel_opaque(Maindice.get_local_mouse_position())
	
	if(diceClicked && isClickedOnSprite):
		# call click method here
		RollDice()
		pass
	pass
	
func AnimateDice() -> void:
	for i in range(0,6):
		await get_tree().create_timer(0.2).timeout
		var index = RandomNumberGenerator.new().randf_range(0,6)
		SetSpriteByIndex(index)
		pass
	OnDiceAniamtionComplate_Local.emit()
	pass

# ----------------- Testing Code ----------------------------------

#func _ready() -> void:
	#for i in range(0,DicesSpriteArray.size()):
		#await get_tree().create_timer(2).timeout
		#SetSpriteByIndex(i)
		#pass
	#pass
	

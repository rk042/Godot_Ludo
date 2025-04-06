class_name Dice

extends Node2D

@export var Maindice: Sprite2D
@export var DicesSpriteArray : Array[Texture2D]
@export var IsTestRun:bool 
@export var IsAutoDiceRoll:bool

signal OnDiceRolled(value: int)
signal OnDiceAniamtionComplate_Local
signal OnDiceRollBegin

func _ready() -> void:
	#AI for testing.
	if IsAutoDiceRoll:
		GameManager.OnGameCurrentStateChange.connect(_on_game_current_state_change)
		pass
	pass

#AI for testing.
func _on_game_current_state_change(updatedState:GameManager.GameStateEnum)-> void:
	if IsAutoDiceRoll:
		match updatedState:
			GameManager.GameStateEnum.PlayerCanRollDice:
				await get_tree().create_timer(2).timeout
				RollDice()
			pass
		pass
	pass

func SetSpriteByIndex(index: int) -> void:
	Maindice.texture = DicesSpriteArray[index]
	pass
	
func RollDice() -> void:
	print("current game state on roll dice ",GameManager.GameCurrentState)
	#wait for player select piece to move
	if(GameManager.GameCurrentState == GameManager.GameStateEnum.PlayerCanRollDice):
		
		OnDiceRollBegin.emit()
		
		# change gamecurrent state to player select piece
		GameManager.UpdateGameCurrentState(GameManager.GameStateEnum.Null)

		var randomNumber = RandomNumberGenerator.new().randf_range(0,6)
		AnimateDice()
		
		await OnDiceAniamtionComplate_Local;
		
		SetSpriteByIndex(randomNumber)
		randomNumber+=1

		# change gamecurrent state to player select piece
		GameManager.UpdateGameCurrentState(GameManager.GameStateEnum.PlayerSelectPiece)
		# for testing purpose directly set 6
		if(IsTestRun):
			randomNumber = 6
			pass
		
		OnDiceRolled.emit(randomNumber)
		pass
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
	

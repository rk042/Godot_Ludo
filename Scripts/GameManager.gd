extends Node

enum GameStateEnum {Null,PlayerCanRollDice,PlayerSelectPiece}

var GameCurrentState = GameStateEnum.PlayerCanRollDice

signal OnPlayerSelectPiece(value:Piece)

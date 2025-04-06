extends Node

enum GameStateEnum {Null,PlayerCanRollDice,PlayerSelectPiece}
enum PieceStateEnum {InLobby,InWayPoint,InHouse}
enum PlayerColor {Green,Yellow,Blue,Red}

var GameCurrentState = GameStateEnum.PlayerCanRollDice

signal OnPlayerSelectPiece(value:Piece) #this is in use please do not remove it.

extends Node

enum GameStateEnum {Null,PlayerCanRollDice,PlayerSelectPiece}
enum PieceStateEnum {InLobby,InWayPoint,InHouse}

var GameCurrentState = GameStateEnum.PlayerCanRollDice

signal OnPlayerSelectPiece(value:Piece)

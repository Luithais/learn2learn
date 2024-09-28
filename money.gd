extends Node2D
class_name PlayerMoney

@export var playerMoney: int

func removeMoney(cash):
	playerMoney -= cash
	
func addMoney(cash):
	playerMoney += cash
	

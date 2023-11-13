extends Node


var AliveCount = 0
var currentCount = 0
var Party = []
var Chara = {"ID":0, "Name":"Mons1", "LV" : 1, "currentXP": 0,"currentHP":80, "maxHP": 100, "speed": 0, "skills":[0,1,2,3],"isAlive":true,"Icon":load("res://icon.svg")}
var Enemy = []
var EnChara = {"ID":1, "Name":"enemy", "LV" : 1, "currentXP": 0,"currentHP":100, "maxHP": 100, "speed": 0, "skills":[0,1,2,3],"isAlive":true,"Icon":load("res://icon.svg")}
var _Items = []
var is_change_item = false
var winLose = "null"
# Called when the node enters the scene tree for the first time.
func _ready():
	Party.append(Chara)
	Chara = {"ID":0, "Name":"Mons2", "LV" : 1, "currentXP": 0,"currentHP":100, "maxHP": 100, "speed": 0, "skills":[0,1,2,3],"isAlive":true,"Icon":load("res://icon.svg")}
	Party.append(Chara)
	Chara = {"ID":0, "Name":"Mons3", "LV" : 1, "currentXP": 0,"currentHP":100, "maxHP": 100, "speed": 0, "skills":[0,1,2,3],"isAlive":true,"Icon":load("res://icon.svg")}
	Party.append(Chara)
	Enemy.append(EnChara)
	for i in Party:
		if i["isAlive"]:
			AliveCount+=1
	_Items.append(Items._items[0])
	pass # Replace with function body.

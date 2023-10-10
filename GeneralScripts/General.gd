extends Node

var AliveCount = 0
var Party = []
var Chara = {"ID":0, "Name":"Mons1", "LV" : 1, "currentXP": 0,"currentHP":100, "maxHP": 100, "speed": 0, "skills":[0,1,2,3],"isAlive":true}
var Enemy = []
var EnChara = {"ID":1, "Name":"enemy", "LV" : 1, "currentXP": 0,"currentHP":100, "maxHP": 100, "speed": 0, "skills":[0,1,2,3],"isAlive":true}
# Called when the node enters the scene tree for the first time.
func _ready():
	Party.append(Chara)
	Chara = {"ID":0, "Name":"Mons2", "LV" : 1, "currentXP": 0,"currentHP":100, "maxHP": 100, "speed": 0, "skills":[0,1,2,3],"isAlive":true}
	Party.append(Chara)
	Chara = {"ID":0, "Name":"Mons3", "LV" : 1, "currentXP": 0,"currentHP":100, "maxHP": 100, "speed": 0, "skills":[0,1,2,3],"isAlive":true}
	Party.append(Chara)
	Enemy.append(EnChara)
	for i in Party:
		if i["isAlive"]:
			AliveCount+=1
	pass # Replace with function body.

extends Control

@export var CurBattle := BattleLogic
@export var CurSys := SystemLogic
@export var CurChara = {}
var party = []
var partyAlive = []
@onready var charaButton01 = $CanvasLayer/CharaBox/VBoxContainer/CharaButton1
@onready var charaButton02 = $CanvasLayer/CharaBox/VBoxContainer/CharaButton2
@onready var charaButton03 = $CanvasLayer/CharaBox/VBoxContainer/CharaButton3
@onready var charaButton04 = $CanvasLayer/CharaBox/VBoxContainer/CharaButton4
@onready var charaButton05 = $CanvasLayer/CharaBox/VBoxContainer/CharaButton5



enum BattleLogic{
	PlayerTurn,
	EnemyTurn,
	SystemTurn
}

enum SystemLogic{
	StartBattle,
	PlayerDied,
	EnemyDied,
	EndBattle
}




# Called when the node enters the scene tree for the first time.
func _ready():
	party = General.Party
	var partyLen = party.size()
	partyAlive = [charaButton01,charaButton02,charaButton03,charaButton04,charaButton05]
	if partyLen>1:
		for i in range(0,partyLen-1):
			partyAlive[i].disabled = !party[i+1]["isAlive"]
	if partyLen<5:
		for i in range(partyLen-1,5):
			partyAlive[i].disabled = true
	pass # Replace with function body.

func _ChooseChara(a):
	var change = party[0]
	print(party[0]["Name"],party[1]["Name"],party[2]["Name"])
	party[0] = party[a]
	party[a] = change
	print(party[0]["Name"])
	$CanvasLayer/CharaBox.visible = false
	if !party[a]["isAlive"]:
		partyAlive[a-1].disabled = true
	pass



func _on_choose_button_pressed():
	$CanvasLayer/CharaBox.visible = true
	pass # Replace with function body.


func _on_chara_button_1_pressed():
	_ChooseChara(1)
	pass # Replace with function body.


func _on_chara_button_2_pressed():
	_ChooseChara(2)
	pass # Replace with function body.


func _on_chara_button_3_pressed():
	_ChooseChara(3)
	pass # Replace with function body.


func _on_chara_button_4_pressed():
	_ChooseChara(4)
	pass # Replace with function body.


func _on_chara_button_5_pressed():
	_ChooseChara(5)
	pass # Replace with function body.

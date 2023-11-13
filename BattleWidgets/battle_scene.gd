extends Control

var CurBattle
var CurSys
@export var CurChara = {}
@export var CurEnemy = {}
var curSkills = []
var party = []
var partyAlive = []
@onready var charaButton01 = $CanvasLayer/CharaBox/VBoxContainer/CharaButton1
@onready var charaButton02 = $CanvasLayer/CharaBox/VBoxContainer/CharaButton2
@onready var charaButton03 = $CanvasLayer/CharaBox/VBoxContainer/CharaButton3
@onready var charaButton04 = $CanvasLayer/CharaBox/VBoxContainer/CharaButton4
@onready var charaButton05 = $CanvasLayer/CharaBox/VBoxContainer/CharaButton5
@onready var MyStatsBar = $CanvasLayer/ColorRect
@onready var EnStatsBar = $CanvasLayer/ColorRect2
@onready var ChooseButton = $CanvasLayer/VBoxContainer/ChooseButton
@onready var ItemButton = $CanvasLayer/VBoxContainer/ItemButton
@onready var RunButton = $CanvasLayer/VBoxContainer/RunButton
@onready var skillButtons = [$CanvasLayer/SkillButton, $CanvasLayer/SkillButton2, $CanvasLayer/SkillButton3, $CanvasLayer/SkillButton4]
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
	CurSys = SystemLogic.StartBattle
	SystemStatus()
	pass # Replace with function body.

func _ChooseChara(a):
	var change = party[0]
	party[0] = party[a]
	party[a] = change
	print(party[0]["Name"])
	$CanvasLayer/CharaBox.visible = false
	if !party[a]["isAlive"]:
		partyAlive[a-1].disabled = true
	_Skills()
	CurChara = party[0]
	match CurSys:
		SystemLogic.PlayerDied:
			CurBattle = BattleLogic.PlayerTurn
			CurSys = null
			_SetCharaStatus(MyStatsBar,CurChara)
			BattleStatus()
		_:
			CurBattle = BattleLogic.EnemyTurn
			_SetCharaStatus(MyStatsBar,CurChara)
			BattleStatus()
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

func _SetCharaStatus(chara,Cur):
	chara.bar.value = float(Cur["currentHP"])/float(Cur["maxHP"])*100
	chara.Name.text = Cur["Name"]
	chara.Lv.text = str("LV:"+str(Cur["LV"]))
	pass

func _Skills():
	curSkills.clear()
	curSkills.append(CharasDic.charaSk[CurChara["skills"][0]])
	curSkills.append(CharasDic.charaSk[CurChara["skills"][1]])
	curSkills.append(CharasDic.charaSk[CurChara["skills"][2]])
	curSkills.append(CharasDic.charaSk[CurChara["skills"][3]])
	$CanvasLayer/SkillButton.text =curSkills[0]["name"]
	$CanvasLayer/SkillButton2.text =curSkills[1]["name"]
	$CanvasLayer/SkillButton3.text =curSkills[2]["name"]
	$CanvasLayer/SkillButton4.text =curSkills[3]["name"]
	pass

func _phyAtk(id,tar):
	var targetCom = null
	var tarBar = null
	match tar:
		0:
			targetCom = CurEnemy
			tarBar = EnStatsBar
			pass
		1:
			targetCom = CurChara
			tarBar = MyStatsBar
			pass
	targetCom["currentHP"] = targetCom["currentHP"]-curSkills[id]["pow"]
	if targetCom["currentHP"]<1:
		targetCom["currentHP"] = 0
		targetCom["isAlive"] = false
		_SetCharaStatus(tarBar,targetCom)
		match tar:
			0:
				CurSys = SystemLogic.EnemyDied
				SystemStatus()
				pass
			1:
				CurSys = SystemLogic.PlayerDied
				SystemStatus()
				pass
	
	match tar:
		0:
			_SetCharaStatus(tarBar,targetCom)
			CurBattle = BattleLogic.EnemyTurn
			BattleStatus()
		1:
			_SetCharaStatus(tarBar,targetCom)
			CurBattle = BattleLogic.PlayerTurn
			BattleStatus()
	pass


func _on_skill_button_pressed():
	_phyAtk(curSkills[0]["id"],0)
	pass # Replace with function body.


func _on_skill_button_2_pressed():
	_phyAtk(curSkills[1]["id"],0)
	pass # Replace with function body.


func _on_skill_button_3_pressed():
	_phyAtk(curSkills[2]["id"],0)
	pass # Replace with function body.


func _on_skill_button_4_pressed():
	_phyAtk(curSkills[3]["id"],0)
	pass # Replace with function body.


func _on_item_button_pressed():
	General.is_change_item = true
	get_tree().change_scene_to_file("res://BattleWidgets/item_box.tscn")
	pass # Replace with function body.
func _on_enemy_phyAtk():
	var enSkill = CurEnemy["skills"]
	var nowSkill = randi_range(0,len(enSkill)-1)
	_phyAtk(enSkill[nowSkill],1)
	pass

func BattleStatus():
	match CurBattle:
		BattleLogic.PlayerTurn:
			ChooseButton.disabled = false
			ItemButton.disabled = false
			RunButton.disabled = false
			for i in skillButtons:
				i.disabled = false
			pass
		BattleLogic.EnemyTurn:
			ChooseButton.disabled = true
			ItemButton.disabled = true
			RunButton.disabled = true
			for i in skillButtons:
				i.disabled = true
			_on_enemy_phyAtk()
			pass
		BattleLogic.SystemTurn:
			pass
	pass

func SystemStatus():
	match CurSys:
		SystemLogic.StartBattle:
			party = General.Party
			var partyLen = party.size()
			partyAlive = [charaButton01,charaButton02,charaButton03,charaButton04,charaButton05]
			if partyLen>1:
				for i in range(0,partyLen-1):
					partyAlive[i].disabled = !party[i+1]["isAlive"]
			if partyLen<5:
				for i in range(partyLen-1,5):
					partyAlive[i].disabled = true
			CurChara = party[0]
			CurEnemy = General.Enemy[0]
			_SetCharaStatus(MyStatsBar,CurChara)
			_SetCharaStatus(EnStatsBar,CurEnemy)
			_Skills()
			ChooseButton.disabled = true
			ItemButton.disabled = true
			RunButton.disabled = true
			for i in skillButtons:
				i.disabled = true
			if General.is_change_item:
				General.is_change_item = false
				CurBattle = BattleLogic.EnemyTurn
				print("yes")
			else :
				CurBattle = BattleLogic.PlayerTurn
			BattleStatus()
			
		SystemLogic.PlayerDied:
			General.AliveCount-=1
			if General.AliveCount==0:
				General.winLose = "Lose"
				CurSys = SystemLogic.EndBattle
				SystemStatus()
			else:
				_on_choose_button_pressed()
		SystemLogic.EnemyDied:
			General.winLose = "Win"
			CurSys = SystemLogic.EndBattle
			SystemStatus()
		SystemLogic.EndBattle:
			get_tree().change_scene_to_file("res://BattleWidgets/win_lose.tscn")
			pass
	pass

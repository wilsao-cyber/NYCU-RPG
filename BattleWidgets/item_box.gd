extends Control
@onready var Mons = [$ColorRect2/MonsChoose/VBoxContainer/Mons1, $ColorRect2/MonsChoose/VBoxContainer/Mons2, $ColorRect2/MonsChoose/VBoxContainer/Mons3, $ColorRect2/MonsChoose/VBoxContainer/Mons4, $ColorRect2/MonsChoose/VBoxContainer/Mons5, $ColorRect2/MonsChoose/VBoxContainer/Mons6]
@onready var itemBlocks = [$ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect2, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect3, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect4, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect5, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect6, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect7, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect8, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect9, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect10, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect11, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect12, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect13, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect14, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect15, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect16, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect17, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect18, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect19, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect20, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect21, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect22, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect23, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect24, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect25, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect26, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect27, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect28, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect29, $ColorRect2/NinePatchRect/ColorRect/ScrollContainer/VBoxContainer/NinePatchRect30]
var lan = len(General.Party)




# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(lan):
		Mons[i].icon = General.Party[i]["Icon"]
	for i in len(General._Items):
		itemBlocks[i].visible = true
		itemBlocks[i].Name = General._Items[i]["name"]
		itemBlocks[i].Num = General._Items[i]["indexs"]
		itemBlocks[i].value = General._Items[i]["value"]
	pass # Replace with function body.

func _restMons(mons):
	for i in Mons:
		i.disabled = false
	mons.disabled = true
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://BattleWidgets/battle_scene.tscn")
	pass # Replace with function body.


func _on_mons_1_pressed():
	_restMons($ColorRect2/MonsChoose/VBoxContainer/Mons1)
	General.currentCount = 0
	pass # Replace with function body.


func _on_mons_2_pressed():
	_restMons($ColorRect2/MonsChoose/VBoxContainer/Mons2)
	General.currentCount = 1
	pass # Replace with function body.


func _on_mons_3_pressed():
	_restMons($ColorRect2/MonsChoose/VBoxContainer/Mons3)
	General.currentCount = 2
	pass # Replace with function body.


func _on_mons_4_pressed():
	_restMons($ColorRect2/MonsChoose/VBoxContainer/Mons4)
	General.currentCount = 3
	pass # Replace with function body.


func _on_mons_5_pressed():
	_restMons($ColorRect2/MonsChoose/VBoxContainer/Mons5)
	General.currentCount = 4
	pass # Replace with function body.


func _on_mons_6_pressed():
	_restMons($ColorRect2/MonsChoose/VBoxContainer/Mons6)
	General.currentCount = 5
	pass # Replace with function body.

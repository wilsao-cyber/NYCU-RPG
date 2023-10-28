extends NinePatchRect

@export var Name =""
@export var Num = 1
@export var value = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$NameText.text = Name
	$NumText.text = "x"+str(Num)
	pass # Replace with function body.


func _on_button_pressed():
	var index = General.currentCount
	General.Party[index]["currentHP"] = General.Party[index]["currentHP"]+value
	if General.Party[index]["currentHP"] > General.Party[index]["maxHP"]:
		General.Party[index]["currentHP"] = General.Party[index]["maxHP"]
	pass # Replace with function body.

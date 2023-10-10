extends ColorRect

@onready var bar = $ProgressBar
@onready var Lv = $LVLabel
@onready var Name =$NameLabel

func _ready():
	bar.value = 100
	pass

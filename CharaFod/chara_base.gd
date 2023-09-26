extends Area2D

@export var ID = 0
@export var Name = "default"
@export var Lv = 1
var currentHP = 0
@export var maxHP = 0
@export var atk = 1
@export var def = 1
@export var speed = 1
@export var currentXP = 0
@export var skills = [0,0,0,0]
@export var isOwned = false
@export var isAlive = true
var choose = false
signal TargetChoosen


# Called when the node enters the scene tree for the first time.
func _ready():
	isAlive = true
	currentHP = maxHP
	pass # Replace with function body.

func _onChoosen():
	print("Hello")
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Interact"):
		_onChoosen()
	pass


func _on_mouse_entered():
	choose = true
	pass # Replace with function body.


func _on_mouse_exited():
	choose = false
	pass # Replace with function body.

extends Node2D

var MozartSprites = [
	Vector2(93, 72)
]

var MozartSol = [11, 7, 11, 4]
var MozartInputs = []
var SucessCounter = 0

var SpriteNode: Sprite2D = null

func _ready():
	MozartInputs = []
	SucessCounter = 0
	
	for child in (get_children()):
		if (child.is_class("Button")):
			child.custom_button_released.connect(_on_button_custom_button_released)

func _on_button_custom_button_pressed(number):
	
	# im just setting this each time to avoid issues i know it's bad im sorry :skull:
	SpriteNode = $MozartSprite
	SpriteNode.region_rect = Rect2(93 + (150 * (12 - number)), 72, 22, 54)
	
	MozartInputs.append(number)
	for i in MozartInputs.size():
		if MozartInputs[i] == MozartSol[i]:
			print("input " + str(i) + " success")
			SucessCounter += 1
			if SucessCounter == 10:
				print("you won!")
				break
		else:
			print("wrong")
			SucessCounter = 0
			MozartInputs = []
	print("test")
	print(MozartInputs)

func _on_button_custom_button_released(number):
	SpriteNode = $MozartSprite
	SpriteNode.region_rect = Rect2(93, 72, 22, 54) # Replace with function body.

extends Node2D

var MozartSprites = [
	Vector2(93, 72)
]

@export var MozartAudio  = {
	"0": load("res://Assets/Sounds/C5.mp3"),
	"1": load("res://Assets/Sounds/Csharp5.mp3"),
	"2": load("res://Assets/Sounds/D5.mp3"),
	"3": load("res://Assets/Sounds/Dsharp5.mp3"),
	"4": load("res://Assets/Sounds/E5.mp3"),
	"5": load("res://Assets/Sounds/F5.mp3"),
	"6": load("res://Assets/Sounds/Fsharp5.mp3"),
	"7": load("res://Assets/Sounds/G5.mp3"),
	"8": load("res://Assets/Sounds/Gsharp5.mp3"),
	"9": load("res://Assets/Sounds/A5.mp3"),
	"10": load("res://Assets/Sounds/Asharp5.mp3"),
	"11": load("res://Assets/Sounds/B5.mp3"),
}

var MozartSol = [11, 7, 11, 4]
var MozartInputs = []
var SucessCounter = 0

var SpriteNode: Sprite2D = null
var AudioPlayer: AudioStreamPlayer2D = null

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
	
	AudioPlayer = $MozartAudio
	AudioPlayer.set_stream(MozartAudio[str(0)])
	
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

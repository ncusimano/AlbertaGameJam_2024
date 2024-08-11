extends Node2D

@onready var vendingMachine = $"Vending Machine"

var blinky_to_price_is
var price_is_to_mozart
var blinky
var price_is
var mozart
var main_audio
var bgk_audio = preload("res://Assets/Sounds/fluoresent_light_hum_and_refrigerator-48831.mp3")
var bgk_music = preload("res://Assets/Sounds/hold_music.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	blinky = get_node("Blinky")
	blinky.solved.connect(_blinky_solved)

	price_is = get_node("PriceIs")
	price_is.set_visible(false)
	price_is.solved.connect(_price_is_solved)

	mozart = get_node("Mozart")
	mozart.set_visible(false)
	mozart.solved.connect(_mozart_solved)

	blinky_to_price_is = get_node("/root/Game/BlinkytoPriceis/AnimationPlayer")
	blinky_to_price_is.get_parent().set_visible(false)

	price_is_to_mozart = get_node("/root/Game/TransitionToMozart/AnimationPlayer2")
	price_is_to_mozart.get_parent().set_visible(false)

	main_audio = get_node("AudioStreamPlayer2D")
	main_audio.set_stream(bgk_audio)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(!main_audio.playing && main_audio.stream == bgk_audio):
		main_audio.play()


func _blinky_solved():
	blinky.set_visible(false)
	blinky_to_price_is.get_parent().set_visible(true)
	blinky_to_price_is.play("BlinkytoPriceis")
	price_is.set_visible(true)


func _price_is_solved():
	price_is.set_visible(false)
	price_is_to_mozart.get_parent().set_visible(true)
	price_is_to_mozart.play("PriceisToMozart")
	mozart.set_visible(true)


func _mozart_solved():
	await get_tree().create_timer(1).timeout
	main_audio.set_stream(bgk_music)
	main_audio.play()

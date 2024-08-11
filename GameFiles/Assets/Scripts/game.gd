extends Node2D

@onready var vendingMachine = $"Vending Machine"

var blinky_to_price_is
var blinky
var price_is
# var mozart

# Called when the node enters the scene tree for the first time.
func _ready():
	blinky = get_node("Blinky")
	blinky.solved.connect(_blinky_solved)

	price_is = get_node("PriceIs")
	price_is.set_visible(false)
	price_is.solved.connect(_price_is_solved)

	# mozart = get_node("Mozart")
	# mozart.set_visible(false)
	# mozart.solved.connect(_mozart_solved)

	blinky_to_price_is = get_node("/root/Game/BlinkytoPriceis/AnimationPlayer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _blinky_solved():
	blinky.set_visible(false)
	blinky_to_price_is.play("BlinkytoPriceis")
	price_is.set_visible(true)


func _price_is_solved():
	pass

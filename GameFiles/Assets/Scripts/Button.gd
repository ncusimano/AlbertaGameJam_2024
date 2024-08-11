extends Button

@export var button_num = 0
@export var sprite_resource = "res://Assets/Sprites/Blinky Buttons.png"
@export var sprite_offset_x = 0
@export var sprite_offset_y = 0
var sprite

signal custom_button_pressed(number)
signal custom_button_released(number)

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = $Sprite2D
	sprite.region_rect.position = Vector2(sprite_offset_x, sprite_offset_y)
	sprite.texture = load(sprite_resource)
	set_action_mode(ACTION_MODE_BUTTON_PRESS)
	button_up.connect(_released)

func set_sprite(offset_x, offset_y):
	sprite_offset_x = offset_x
	sprite_offset_y = offset_y
	sprite.region_rect.position = Vector2(offset_x, offset_y)

func _pressed():
	custom_button_pressed.emit(button_num)
	sprite.region_rect.position.x -= 21

func _released():
	custom_button_released.emit(button_num)
	sprite.region_rect.position.x += 21


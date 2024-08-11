extends Button

@export var button_num = 0

const SPRITE_POS_INIT_VALUE = Vector2(21, 0)
@export var sprite_position: Vector2 = SPRITE_POS_INIT_VALUE

const SPRITE_SHEET_INIT_VALUE = "res://Assets/Sprites/Blinky Buttons.png"
 
var sprite

signal custom_button_pressed(number)
signal custom_button_released(number)

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = get_node("Sprite2D")
	sprite.texture = preload(SPRITE_SHEET_INIT_VALUE)
	sprite.region_rect.position = sprite_position

	
	set_action_mode(Button.ACTION_MODE_BUTTON_PRESS)
	button_up.connect(_released)


func set_sprite_abs(pos_x, pos_y):
	# Sets the absolute position of the window in the spritesheet.
	sprite_position = Vector2(pos_x, pos_y)
	sprite.region_rect.position = sprite_position


func set_sprite_rel(offset_x, offset_y):
	# Adjusts the position of the window in the spritesheet relative to previous position.
	sprite.region_rect.position.x += offset_x
	sprite.region_rect.position.y += offset_y

func _pressed():
	custom_button_pressed.emit(button_num)
	sprite.region_rect.position.x -= 21

func _released():
	custom_button_released.emit(button_num)
	sprite.region_rect.position.x += 21


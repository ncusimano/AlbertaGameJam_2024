extends Button

@export var button_num = 0
signal custom_button_pressed(number)
signal custom_button_released(number)

# Called when the node enters the scene tree for the first time.
func _ready():
	set_action_mode(Button.ACTION_MODE_BUTTON_PRESS)
	button_up.connect(_released)

func _pressed():
	custom_button_pressed.emit(button_num)

func _released():
	custom_button_released.emit(button_num)


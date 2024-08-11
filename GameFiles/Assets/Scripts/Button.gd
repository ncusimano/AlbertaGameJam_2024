extends Button

@export var button_num = 0
@export var animation = ""

signal custom_button_pressed(number)
signal custom_button_released(number)

# Called when the node enters the scene tree for the first time.
func _ready():
	#$AnimatedSprite2D.set_animation(animation)
	set_action_mode(ACTION_MODE_BUTTON_PRESS)


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	# pass


func _pressed():
	custom_button_pressed.emit(button_num)
	# Play the pressing animation.
	#$AnimatedSprite2D.play()


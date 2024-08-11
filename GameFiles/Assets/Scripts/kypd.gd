extends Node2D
var timer = null
var current_button = null
var timer_cycles = 0
var time_pressed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect and configure the timer for tracking button press length.
	timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)
	timer.set_one_shot(false)

	print("Button ready")
	
	# Connect button signals for each button.
	for child in (get_children()):
		if (has_signal("custom_button_pressed")):
			child.custom_button_pressed.connect(_on_button_pressed)
			child.custom_button_released.connect(_on_button_released)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (!timer.is_stopped()):
		time_pressed = timer_cycles * timer.wait_time + (timer.wait_time - timer.time_left)


func _on_button_pressed(number):
	current_button = number
	timer_cycles = 0
	time_pressed = 0
	timer.start()


func _on_button_released(number):
	print("hey sup.")
	if (number == current_button):
		timer.stop()
		current_button = null
		print("Button " + current_button + ": " + time_pressed)


func _on_timer_timeout():
	timer_cycles += 1

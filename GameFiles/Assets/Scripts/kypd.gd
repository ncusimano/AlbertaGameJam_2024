extends Node2D
var timer
var current_button = null
var timer_cycles = 0
var time_pressed = 0

signal kypd_button_pressed(current_button)
signal kypd_button_released(time_pressed)

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect and configure the timer for tracking button press length.
	timer = get_node("Timer")
	timer.timeout.connect(_on_timer_timeout)
	timer.set_one_shot(false)

	# Connect button signals for each button.
	for child in (get_children()):
		if (child != get_node("Timer")):
			print("Hey")
			child.custom_button_pressed.connect(_on_button_pressed)
			child.custom_button_released.connect(_on_button_released)


func _on_button_pressed(number):
	# Only counts as pressed if no other button is currently pressed.
	# We want this so we can easily flash other buttons by
	# toggling them to pressed, and then just ignoring the resulting signal.
	if (current_button == null):
		current_button = number
		timer_cycles = 0
		time_pressed = 0
		timer.start()

		# Tell other objects a button is pressed.
		kypd_button_pressed.emit(current_button)


func _on_button_released(number):
	if (current_button == null):
		print("Button is null")
	elif (number == current_button):
		timer.stop()
		print("Button " + str(current_button) + ": " + str(time_pressed))
		current_button = null

		# Calculate the total time the timer has been running for.
		time_pressed = timer_cycles * timer.wait_time + (timer.wait_time - timer.time_left)

		# Send the button released signal
		kypd_button_released.emit(time_pressed)


func _on_timer_timeout():
	timer_cycles += 1

func get_button(button_num):
	return get_children()[button_num]
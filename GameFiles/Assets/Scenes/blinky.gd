extends Node2D
# This script contains the logic for the puzzle Blinky.

var next_button = 0
var button_index = 0
var next_kypd = ""
var detecting = false

var soln_sequence
var sequence_length = 3

var rng = RandomNumberGenerator.new()

var is_solved = false

# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect signals from each individual keypad.
	$Numpad.kypd_button_pressed.connect(_numpad_pressed)
	# $Numpad.kypd_button_released.connect(_numpad_released)

	$Letterpad.kypd_button_pressed.connect(_letterpad_pressed)
	# $Letterpad.kypd_button_pressed.connect(_letterpad_released)

	# Make the solution sequence.
	reset_sequence()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _numpad_pressed(button_num):
	pass


# func _numpad_released(time_pressed):
	# pass


func _letterpad_pressed(button_num):
	pass


# func _letterpad_released(time_pressed):
	# pass

func 

func detect_sequence(kypd_pressed, button_num):
	# Check if the correct button was pressed, or if the sequence has been started.
	if (not detecting):
		pass
	
	# Assign the next pad to be lit (and pressed for the soln) based on what was just clicked.
	match kypd_pressed:
		"Numpad":
			next_kypd = "Letterpad"
		"Letterpad":
			next_kypd = "Numpad"

	# Flash the key on the corresponding next pad, if applicable.
	var button_to_light = get_node(next_kypd).get_button(button_num)
	flash_button(button_to_light)

func reset_sequence():
	# Resets and rerondomizes the sequence if the player gets it wrong and for setup.
	soln_sequence = []
	for i in range(0, sequence_length):
		soln_sequence.append(rng.randi_range(0, 8))
	
	button_index = 0
	next_button = soln_sequence[button_index]

func flash_button(flashed_button):
	# await suspends this function until the timer runs out, but allows the code
	# that called the function to continue running in the meantime. This means you can still
	# press buttons even while the prompt is flashing.
	flashed_button.set_pressed(true)
	await get_tree().create_timer(0.5).timeout
	flashed_button.set_pressed(false)
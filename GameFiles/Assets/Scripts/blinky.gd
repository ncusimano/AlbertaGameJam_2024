extends Node2D
# This script contains the logic for the puzzle Blinky.

var next_button_index = 0
var next_kypd = ""
var detecting = false
@export var prompt_time = 0.5 # in seconds


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


func _numpad_pressed(button_num):
	if (not is_solved):
		detect_sequence("Numpad", button_num)


# func _numpad_released(time_pressed):
	# pass


func _letterpad_pressed(button_num):
	if (not is_solved):
		detect_sequence("Letterpad", button_num)


# func _letterpad_released(time_pressed):
	# pass


func detect_sequence(kypd_pressed, button_num):
	# Check if the correct button was pressed, or if the sequence has been started.
	if (not detecting):
		# Listen for the sequence after the first button press.
		detecting = true

		print("Listening for solution sequence.")
	elif (kypd_pressed == next_kypd && button_num == soln_sequence[next_button_index]):
		# Correct button press.
		if (next_button_index != len(soln_sequence) - 1):
			next_button_index += 1

			print("Correct, press next button in pattern.")
		else:
			# If the end of the sequence is reached, the puzzle is solved.
			is_solved = true
			print("Solved!")
			# Play solved jingle here! -----------------------------

			# Transition to next puzzle in the main game controller.
	else:
		reset_sequence()
		print("Incorrect sequence, resetting.")

	# Set which keypad should be next.
	if (kypd_pressed == "Numpad"):
		next_kypd = "Letterpad"
	else:
		next_kypd = "Numpad"

	# Prompt the user by flashing the correct key on the next pad.
	var button_to_light = get_node(next_kypd).get_button(soln_sequence[next_button_index])
	print(button_to_light)
	flash_button(button_to_light)


func reset_sequence():
	detecting = false

	# Resets and rerondomizes the sequence if the player gets it wrong and for setup.
	soln_sequence = []
	for i in range(0, sequence_length):
		soln_sequence.append(rng.randi_range(0, 8))
	
	next_button_index = 0

func flash_button(flashed_button):
	# await suspends this function until the timer runs out, but allows the code
	# that called the function to continue running in the meantime. This means you can still
	# press buttons even while the prompt is flashing.
	flashed_button.set_sprite_rel(-21, 0)
	await get_tree().create_timer(prompt_time).timeout
	flashed_button.set_sprite_rel(21, 0)

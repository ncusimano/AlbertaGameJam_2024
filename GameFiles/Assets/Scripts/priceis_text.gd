extends Node2D

var DigitMap = {
	"1": Vector2(0, 0),
	"2": Vector2(7, 0),
	"3": Vector2(14, 0),
	"4": Vector2(0, 7),
	"5": Vector2(7, 7),
	"6": Vector2(14, 7),
	"7": Vector2(0, 14),
	"8": Vector2(7, 14),
	"9": Vector2(14, 14),
	"0": Vector2(0, 21),
	}

var input_digits = [0, 0, 0]

# 2.37 + 1.26 = 3.63
var answer = [3, 6, 3]

var input_count = 0

var is_solved = false

func _ready():
	var num_pad = get_node("/root/Game/BlinkytoPriceis/Numpad")
	num_pad.kypd_button_pressed.connect(_on_numpad_press)


func _on_numpad_press(button_num):
	# Puzzle only allows interaction when unsolved.
	if(not is_solved and button_num != null):
		input_digits.pop_front()
		input_digits.append(button_num + 1)

		input_count += 1

		# Set the display digits.
		setdigit(0, input_digits[0])
		setdigit(1, input_digits[1])
		setdigit(2, input_digits[2])

		if (input_count == 3):
			if (input_digits == answer):
				print("Solved!")
				is_solved = true
				input_count = 0

				# Play win sound here! -------------------------------------
			else:
				print("Incorrect")
				await get_tree().create_timer(1.0).timeout
				input_digits = [0, 0, 0]
				input_count = 0

				# Reset the display digits.
				setdigit(0, input_digits[0])
				setdigit(1, input_digits[1])
				setdigit(2, input_digits[2])

# Use this to set the text for the three digits, "DigitIndex"(0-2) sets what digit of the three you are targeting, "Number"(0-9) is the number you want it to display
func setdigit(DigitIndex, Number):
	var TargetDigit = null
	if DigitIndex >= 0 and DigitIndex <= 2:
		
		#this do be shitty but i dont know why an array doesnt work soo
		if DigitIndex == 0:
			TargetDigit = $"First Digit"
		elif DigitIndex == 1:
			TargetDigit = $"Second Digit"
		elif DigitIndex == 2:
			TargetDigit = $"Third Digit"
			
		if Number >= 0 and Number <= 9 and TargetDigit != null:
			TargetDigit.region_rect = Rect2(DigitMap[str(Number)].x, DigitMap[str(Number)].y, 6, 6)
		else:
			print("Number out of bounds")
			return
	else:
		print("DigitIndex out of bounds")
		return

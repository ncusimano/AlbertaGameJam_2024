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

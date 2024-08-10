extends Camera2D

var movevalue = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (self.position.y + movevalue >= 32.75):
		self.position.y = 32.75
	
	elif (self.position.y + movevalue <= -32.75):
		self.position.y = -32.75
	else:
		self.position.y += movevalue

func _on_area_2d_mouse_entered():
	movevalue = -1
	print(movevalue)


func _on_area_2d_mouse_exited():
	movevalue = 0
	print(movevalue)


func _on_area_2d_2_mouse_entered_negative():
	movevalue = 1
	print(movevalue) # Replace with function body.


func _on_area_2d_2_mouse_exited_negative():
	movevalue = 0
	print(movevalue) # Replace with function body.

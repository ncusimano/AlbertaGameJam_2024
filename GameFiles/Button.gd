extends Button
signal custom_button_pressed(number)
@export var buttonnumber = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var number = buttonnumber
	custom_button_pressed.emit(number)
	

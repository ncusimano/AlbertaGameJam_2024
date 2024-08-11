extends Button

@export var buttonnum = 0
@export var animation = ""

signal custombuttonpressed(number)

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.set_animation(animation)



# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
	# pass


func _on_pressed():
	var number = buttonnum
	custombuttonpressed.emit(number)
	# Play the pressing animation.
	$AnimatedSprite2D.play()



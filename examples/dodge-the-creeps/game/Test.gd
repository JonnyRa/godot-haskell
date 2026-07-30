extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func doSomething(firstParam, secondParam):
	var format = "first %s, second %s"
	$Params.text = format % [firstParam, secondParam]
	
func callBackToHaskell(main):
	main.setMessage("horse")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

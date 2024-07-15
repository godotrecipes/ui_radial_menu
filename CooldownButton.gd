extends TextureButton
class_name CooldownButton

@export var cooldown = 1.0


func _ready():
	$Label.hide()
	$CooldownDisplay.value = 0
	$CooldownDisplay.texture_progress = texture_normal
	$Timer.wait_time = cooldown
	set_process(false)


func _process(delta):
	$Label.text = "%3.1f" % $Timer.time_left
	$CooldownDisplay.value = int(($Timer.time_left / cooldown) * 100)
	
	
func _on_CooldownButton_pressed():
	disabled = true
	set_process(true)
	$Timer.start()
	$Label.show()


func _on_Timer_timeout():
	print("ability ready")
	$CooldownDisplay.value = 0
	disabled = false
	$Label.hide()
	set_process(false)

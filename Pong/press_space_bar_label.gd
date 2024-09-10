extends Label

var is_visible = true
var show_text = true

func _ready():
	blink_text()

func blink_text():
	while show_text:
		is_visible = !is_visible
		self.visible = is_visible
		await get_tree().create_timer(0.5).timeout

func start_blink():
	show_text = true
	blink_text()

func stop_blink():
	show_text = false
	self.visible = false

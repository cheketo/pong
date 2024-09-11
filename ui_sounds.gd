extends Node

@export var root_path : NodePath

@onready var sounds = {
	&"UI_Hover" : AudioStreamPlayer.new(),
	&"UI_Click" : AudioStreamPlayer.new()
}

func _ready() -> void:
	assert(root_path != null, "Empty root path for UI Sounds!")
	
	for i in sounds.keys():
		sounds[i].stream = load("res://Assets/SFX/" + str(i) + ".wav")
		sounds[i].bus = &"UI"
		add_child(sounds[i])
	install_sounds(get_node(root_path))

func install_sounds(node: Node) -> void:
	for i in node.get_children():
		if i is Button:
			i.mouse_entered.connect(ui_sfx_play.bind(&"UI_Hover"))
			i.pressed.connect(ui_sfx_play.bind(&"UI_Click"))
		elif i is LineEdit:
			i.text_changed.connect(ui_sfx_play2.bind(&"UI_Click"))

func ui_sfx_play(sound : String) -> void:
	sounds[sound].play()

func ui_sfx_play2(_any, sound : String) -> void:
	sounds[sound].play()

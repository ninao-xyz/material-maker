extends WindowDialog

var float_edit = null

onready var editor = $MarginContainer/VBoxContainer/TextEdit

func _ready():
	pass # Replace with function body.

func edit_parameter(fe):
	float_edit = fe
	window_title = "Expression editor - "+fe.name
	editor.text = fe.get_value()
	popup_centered()
	editor.cursor_set_column(editor.text.length())
	editor.grab_focus()



func _on_Apply_pressed():
	var value = editor.text.replace("\n", "").strip_edges()
	if value.is_valid_float():
		float_edit.set_value(float(value), true)
	else:
		float_edit.set_value(value, true)

func _on_OK_pressed():
	_on_Apply_pressed()
	queue_free()

func _on_Cancel_pressed():
	queue_free()

func _on_TextEdit_gui_input(event):
	if event is InputEventKey and event.pressed:
		match event.scancode:
			KEY_ENTER:
				_on_OK_pressed()
			KEY_ESCAPE:
				_on_Cancel_pressed()

extends PopupPanel

# Adapted from Abdulrahim's original room selector, commits 53d2777–f5c42a2.
signal room_type_selected(tile_data: Dictionary, room_type_id: String)
signal selection_cancelled

@onready var room_type_list: VBoxContainer = $MarginContainer/VBoxContainer/RoomTypeList
@onready var cancel_button: Button = $MarginContainer/VBoxContainer/HBoxContainer/CancelButton

var current_tile_data: Dictionary = {}


func _ready() -> void:
	hide()
	cancel_button.pressed.connect(_on_cancel_pressed)


func open_for_tile(tile_data: Dictionary, room_types: Array) -> void:
	current_tile_data = tile_data.duplicate()
	_populate_room_types(room_types)
	popup_centered()


func _populate_room_types(room_types: Array) -> void:
	for child in room_type_list.get_children():
		# Remove immediately so a refresh exposes only the new options.
		room_type_list.remove_child(child)
		child.queue_free()

	for room in room_types:
		var button := Button.new()
		button.text = room["name"]
		button.pressed.connect(_on_room_type_pressed.bind(room["id"]))
		room_type_list.add_child(button)


func _on_room_type_pressed(room_type_id: String) -> void:
	room_type_selected.emit(current_tile_data, room_type_id)
	hide()


func _on_cancel_pressed() -> void:
	selection_cancelled.emit()
	hide()

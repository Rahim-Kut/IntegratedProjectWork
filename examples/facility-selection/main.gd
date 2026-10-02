extends Control

const ROOM_TYPES = [
	{"id": "store:Electronics", "name": "Electronics store"},
	{"id": "store:Clothes", "name": "Clothing store"},
	{"id": "restaurant:Cafe", "name": "Cafe"},
	{"id": "toilet", "name": "Restroom"},
]
const SELECTED_TILE = {"x": 5, "y": 3}

@onready var popup: PopupPanel = $RoomTypePopup
@onready var status_label: Label = $MarginContainer/Content/Status


func _ready() -> void:
	$MarginContainer/Content/ChooseButton.pressed.connect(_on_choose_pressed)
	popup.room_type_selected.connect(_on_room_selected)
	popup.selection_cancelled.connect(_on_cancelled)


func _on_choose_pressed() -> void:
	popup.open_for_tile(SELECTED_TILE, ROOM_TYPES)


func _on_room_selected(tile: Dictionary, room_type_id: String) -> void:
	for room in ROOM_TYPES:
		if room["id"] == room_type_id:
			status_label.text = "%s selected for tile (%d, %d)." % [
				room["name"], tile["x"], tile["y"]
			]
			return


func _on_cancelled() -> void:
	status_label.text = "Selection cancelled."

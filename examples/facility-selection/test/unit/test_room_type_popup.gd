extends GutTest

# Based on the popup tests Abdulrahim added to the original simulator.
const POPUP_SCENE = preload("res://view/room_type_popup.tscn")
var popup: PopupPanel


func before_each() -> void:
	popup = POPUP_SCENE.instantiate()
	add_child_autofree(popup)
	await get_tree().process_frame
	watch_signals(popup)


func test_selection_returns_the_tile_and_type_and_hides_popup() -> void:
	var tile := {"x": 5, "y": 3}
	popup.open_for_tile(tile, [
		{"id": "store:Electronics", "name": "Electronics store"},
		{"id": "toilet", "name": "Restroom"},
	])
	var list: VBoxContainer = popup.room_type_list
	assert_eq(list.get_child_count(), 2)
	assert_eq(list.get_child(1).text, "Restroom")

	(list.get_child(1) as Button).pressed.emit()
	assert_signal_emitted_with_parameters(popup, "room_type_selected", [tile, "toilet"])
	assert_eq(get_signal_emit_count(popup, "room_type_selected"), 1)
	assert_false(popup.visible)


func test_reopening_replaces_options_and_updates_the_selected_tile() -> void:
	popup.open_for_tile({"x": 1, "y": 1}, [
		{"id": "old:Type", "name": "Old option"},
	])
	var new_tile := {"x": 9, "y": 2}
	popup.open_for_tile(new_tile, [
		{"id": "restaurant:Cafe", "name": "Cafe"},
	])
	assert_eq(popup.room_type_list.get_child_count(), 1)
	assert_eq(popup.room_type_list.get_child(0).text, "Cafe")
	await get_tree().process_frame
	(popup.room_type_list.get_child(0) as Button).pressed.emit()
	assert_signal_emitted_with_parameters(popup, "room_type_selected", [new_tile, "restaurant:Cafe"])


func test_cancel_hides_popup_without_selecting_a_type() -> void:
	popup.open_for_tile({"x": 1, "y": 1}, [
		{"id": "toilet", "name": "Restroom"},
	])
	popup.cancel_button.pressed.emit()
	assert_signal_emitted(popup, "selection_cancelled")
	assert_signal_not_emitted(popup, "room_type_selected")
	assert_false(popup.visible)

extends Control

signal test_finished(score_result)

@onready var question_label = $PanelContainer/VBoxContainer/Label
@onready var words_grid = $PanelContainer/VBoxContainer/GridContainer
@onready var finish_button = $PanelContainer/VBoxContainer/Hotovo

var current_test_data = {
	"question": "Která slova souvisí s Romantismem?",
	"words": [
		{"text": "Mácha", "correct": true},
		{"text": "Rozum", "correct": false},
		{"text": "City", "correct": true},
		{"text": "Továrna", "correct": false},
		{"text": "Sen", "correct": true},
		{"text": "Realita", "correct": false}
	]
}
var selected_words = []

func _on_ready() -> void:
	setup_test()
	finish_button.pressed.connect(_on_finish_pressed)
func setup_test():
	question_label.text = current_test_data["question"]
	for child in words_grid.get_children():
		child.queue_free()
	for word_data in current_test_data["words"]:
		var btn = Button.new()
		btn.text = word_data["text"]
		btn.toggle_mode = true 
		btn.custom_minimum_size = Vector2(100, 50)
		words_grid.add_child(btn)
func _on_finish_pressed():
	var score = 0
	var total_correct_options = 0
	var buttons = words_grid.get_children()
	for i in range(buttons.size()):
		var btn = buttons[i]
		var data = current_test_data["words"][i]
		
		if data["correct"]:
			total_correct_options += 1
			if btn.button_pressed:
				score += 1 # Bod za správné označení
		else:
			if btn.button_pressed:
				score -= 1 #minus bodik
	if score < 0: score = 0
	print("Výsledné skóre: ", score)
	emit_signal("test_finished", score)
	queue_free()

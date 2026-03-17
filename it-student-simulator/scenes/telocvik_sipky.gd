extends CanvasLayer
@onready var kontejner_sipek = $VBoxContainer/KontejnerSipek
@onready var casomira_label = $VBoxContainer/Casomira
@onready var casovac = $Casovac

var sekvence = []
var aktualni_krok = 0
var delka_sekvence = 15
const SMERY = ["ui_up", "ui_down", "ui_left", "ui_right"]
const IKONY = {
	"ui_up": "⬆️",
	"ui_down": "⬇️",
	"ui_left": "⬅️",
	"ui_right": "➡️"
}
func _on_ready() -> void:
	casovac.timeout.connect(_na_konec_casu)
func _process(_delta):
	casomira_label.text = "Zbývá: " + str(ceil(casovac.time_left)) + " s"
func vygeneruj_sekvenci():
	sekvence.clear()
	aktualni_krok = 0
	for dite in kontejner_sipek.get_children():
		dite.queue_free()
	for i in range(delka_sekvence):
		var nahodny_smer = SMERY.pick_random()
		sekvence.append(nahodny_smer)
		var sipka_label = Label.new()
		sipka_label.text = IKONY[nahodny_smer]
		sipka_label.add_theme_font_size_override("font_size", 64)
		kontejner_sipek.add_child(sipka_label)
func _input(event):
	if not event.is_pressed() or event.is_echo():
		return
	var ocekavany_smer = sekvence[aktualni_krok]
	if event.is_action_pressed(ocekavany_smer):
		uspesny_stisk()
	else:
		for smer in SMERY:
			if event.is_action_pressed(smer):
				chybny_stisk()
				break
func uspesny_stisk():
	var sipka_label = kontejner_sipek.get_child(aktualni_krok)
	sipka_label.modulate = Color(0.2, 0.8, 0.2)
	aktualni_krok += 1
	if aktualni_krok >= sekvence.size():
		vyhra()
func chybny_stisk():
	vygeneruj_sekvenci()
func vyhra():
	casovac.stop()
	print("Výhra! Úkol splněn.")
	Dialogic.start("res://dialogicYap/Chapter 2/telakVyhra.dtl")
	queue_free()
func _na_konec_casu():
	print("Konec času! Prohra.")
	Dialogic.start("res://dialogicYap/Chapter 2/telakProhra.dtl")
	queue_free()

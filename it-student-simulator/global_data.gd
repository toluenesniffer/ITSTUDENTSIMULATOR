extends Node

const SAVE_PATH = "user://save_game.cfg"

var current_chapter = 1

func save_game():
	var config = ConfigFile.new()
	config.set_value("Progress", "chapter", current_chapter)
	var err = config.save(SAVE_PATH)
	if err != OK:
		print("Chyba při ukládání!")
func load_game():
	var config = ConfigFile.new()
	var err = config.load(SAVE_PATH)
	if err != OK:
		print("Žádný save nenalezen, začínáme od nuly.")
		return
	current_chapter = config.get_value("Progress", "chapter", 1)
	print("Hra načtena, kapitola: ", current_chapter)

var is_dialog_active = false
var player_speed = 300.0
var master_volume = 1.0

func _ready():
	Dialogic.timeline_started.connect(_on_dialog_started)
	Dialogic.timeline_ended.connect(_on_dialog_ended)
	
func fixgrades():
	Dialogic.VAR.Znamky.cestinaZnamka = int(Dialogic.VAR.Znamky.cestinaZnamka)
	Dialogic.VAR.Znamky.prgZnamka = int(Dialogic.VAR.Znamky.prgZnamka)
	Dialogic.VAR.Znamky.matikaZnamka = int(Dialogic.VAR.Znamky.matikaZnamka)
	Dialogic.VAR.Znamky.angZnamka = int(Dialogic.VAR.Znamky.angZnamka)
	Dialogic.VAR.Znamky.elkZnamka = int(Dialogic.VAR.Znamky.elkZnamka)
	Dialogic.VAR.Znamky.infZnamka = int(Dialogic.VAR.Znamky.infZnamka)
	Dialogic.VAR.Znamky.fyzZnamka = int(Dialogic.VAR.Znamky.fyzZnamka)
	Dialogic.VAR.Znamky.obnZnamka = int(Dialogic.VAR.Znamky.obnZnamka)
	Dialogic.VAR.Znamky.dejZnamka = int(Dialogic.VAR.Znamky.dejZnamka)
	Dialogic.VAR.Znamky.telocvikZnamka = int(Dialogic.VAR.Znamky.telocvikZnamka)
	##################################################xx
	Dialogic.VAR.Znamky.webisky2Znamka = int(Dialogic.VAR.Znamky.webisky2Znamka)
	Dialogic.VAR.Znamky.kybisky2Znamka = int(Dialogic.VAR.Znamky.kybisky2Znamka)
	Dialogic.VAR.Znamky.cestina2Znamka = int(Dialogic.VAR.Znamky.cestina2Znamka)
	Dialogic.VAR.Znamky.matika2Znamka = int(Dialogic.VAR.Znamky.matika2Znamka)
	Dialogic.VAR.Znamky.hardwareZnamka = int(Dialogic.VAR.Znamky.hardwareZnamka)
	Dialogic.VAR.Znamky.grafikaZnamka = int(Dialogic.VAR.Znamky.grafikaZnamka)
	Dialogic.VAR.Znamky.fyzika2Znamka = int(Dialogic.VAR.Znamky.fyzika2Znamka)
	Dialogic.VAR.Znamky.prg2Znamka = int(Dialogic.VAR.Znamky.prg2Znamka)
	Dialogic.VAR.Znamky.elk2Znamka = int(Dialogic.VAR.Znamky.elk2Znamka)
	Dialogic.VAR.Znamky.inf2Znamka = int(Dialogic.VAR.Znamky.inf2Znamka)
	Dialogic.VAR.Znamky.mikroelkZnamka = int(Dialogic.VAR.Znamky.mikroelkZnamka)
	Dialogic.VAR.Znamky.telak2Znamka = int(Dialogic.VAR.Znamky.telak2Znamka)
func _on_dialog_started():
	is_dialog_active = true
func _on_dialog_ended():
	is_dialog_active = false

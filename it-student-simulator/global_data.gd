extends Node

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
func _on_dialog_started():
	is_dialog_active = true
func _on_dialog_ended():
	is_dialog_active = false

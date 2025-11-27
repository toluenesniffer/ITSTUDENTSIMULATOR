extends Node2D

var skore = 0
var je_konec_hry = false
var cilove_skore = 50



func _on_ready() -> void:
	Dialogic.start("res://dialogicYap/intro/telocvik.dtl")
	$ProgressBar.visible = false
	Dialogic.signal_event.connect(_on_dialogic_signal)
func _on_dialogic_signal(argument: String):
	if argument == "start_telocvik":
		zacni_cvicit()
func zacni_cvicit():
	TaskUI.show_task("MAČKEJ MEZERNÍK CO NEJRYCHLEJI 50X (MÁŠ 15 SEKUND)")
	skore = 0
	je_konec_hry = false
	$ProgressBar.value = 0
	$ProgressBar.visible = true
	$Timer.start()
func _process(_delta):
	if je_konec_hry:
		return
	if not $Timer.is_stopped():
		if Input.is_action_just_pressed("ui_accept"):
			skore += 1
			$ProgressBar.value = skore
			if skore >= cilove_skore:
				ukonci_hru(true)



func _on_timer_timeout() -> void:
	ukonci_hru(false)
func ukonci_hru(vyhral):
	if je_konec_hry:
		return
	je_konec_hry = true
	$Timer.stop()
	$ProgressBar.visible = false
	if vyhral:
		Dialogic.VAR.Znamky.telocvikZnamka = 1
		Dialogic.start("res://dialogicYap/intro/telocvik_vyhra.dtl")
	else:
		Dialogic.VAR.Znamky.telocvikZnamka = 5
		Dialogic.start("res://dialogicYap/intro/telocvik_prohra.dtl")

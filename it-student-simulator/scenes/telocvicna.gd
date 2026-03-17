extends Node2D

var skore = 0
var je_konec_hry = false
var cilove_skore = 50

const MINIHRA_SCENA = preload("res://scenes/TelocvikSipky.tscn")

func _on_ready() -> void:
	if (Dialogic.VAR.dejepisPlayed == true and Dialogic.VAR.Znamky.telocvikPlayed == false):
		Dialogic.start("res://dialogicYap/intro/telocvik.dtl")
	if (Dialogic.VAR.elk2Played == true and Dialogic.VAR.telocvik_d1Played == false):
		Dialogic.start("res://dialogicYap/Chapter 2/telocvik_druhak.dtl")
	$ProgressBar.visible = false
	Dialogic.signal_event.connect(_on_dialogic_signal)
func _on_dialogic_signal(argument: String):
	if argument == "start_telocvik":
		zacni_cvicit()
	elif argument == "konec":
		TaskUI.show_task("JDI VEN (KLIKNI NA DVEŘE)")
	if argument == "spust_sipky":
		print("HALÓ! SIGNÁL DORAZIL A MINIHRU VYTVÁŘÍM!")
		var nova_minihra = MINIHRA_SCENA.instantiate()
		add_child(nova_minihra)
		nova_minihra.vygeneruj_sekvenci()
		nova_minihra.casovac.start()
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
		var zbyvajici_cas = ceil($Timer.time_left)
		$TimeLabel.text = str(zbyvajici_cas)
		if Input.is_action_just_pressed("ui_accept"):
			skore += 1
			$ProgressBar.value = skore
			if skore >= cilove_skore:
				ukonci_hru(true)

func _on_timeline_started():
	SFXManager.change_music("res://music/ukolhudba.mp3")

func _on_timer_timeout() -> void:
	ukonci_hru(false)
func ukonci_hru(vyhral):
	if je_konec_hry:
		return
	je_konec_hry = true
	$Timer.stop()
	$ProgressBar.visible = false
	$TimeLabel.visible = false
	if vyhral:
		Dialogic.VAR.Znamky.telocvikZnamka = 1
		TaskUI.reset_color()
		TaskUI.hide_task()
		Dialogic.start("res://dialogicYap/intro/telocvik_vyhra.dtl")
	else:
		Dialogic.VAR.Znamky.telocvikZnamka = 5
		TaskUI.reset_color()
		TaskUI.hide_task()
		Dialogic.start("res://dialogicYap/intro/telocvik_prohra.dtl")

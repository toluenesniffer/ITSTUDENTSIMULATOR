extends Node2D

var skore = 0
var je_konec_hry = false
var cilove_skore = 50

const MINIHRA_SCENA = preload("res://scenes/TelocvikSipky.tscn")
const MINIHRA_STAFETA = preload("res://scenes/StafetaMinihra.tscn")

func _on_ready() -> void:
	if (Dialogic.VAR.dejepisPlayed == true and Dialogic.VAR.Znamky.telocvikPlayed == false):
		Dialogic.start("res://dialogicYap/intro/telocvik.dtl")
	if (Dialogic.VAR.elk2Played == true and Dialogic.VAR.telocvik_d1Played == false):
		Dialogic.start("res://dialogicYap/Chapter 2/telocvik_druhak.dtl")
	elif(Dialogic.VAR.prg3Played == true and Dialogic.VAR.telak3_1Played == false):
		Dialogic.start("res://dialogicYap/Chapter 3/telak3_1.dtl")
	elif(Dialogic.VAR.rprPlayed == true and Dialogic.VAR.boss1 == false):
		Dialogic.start("res://dialogicYap/Chapter 3/telak_FINALBOSS.dtl")
	$ProgressBar.visible = false
	Dialogic.signal_event.connect(_on_dialogic_signal)
func _on_dialogic_signal(argument: String):
	if argument == "start_telocvik":
		zacni_cvicit()
	elif argument == "konec":
		TaskUI.show_task("JDI VEN DO TŘÍDY B209")
	if argument == "spust_sipky":
		print("HALÓ! SIGNÁL DORAZIL A MINIHRU VYTVÁŘÍM!")
		var nova_minihra = MINIHRA_SCENA.instantiate()
		add_child(nova_minihra)
		nova_minihra.vygeneruj_sekvenci()
		nova_minihra.casovac.start()
	if argument == "start_stafeta":
		spust_stafetu()
func spust_stafetu():
	var instance_stafety = MINIHRA_STAFETA.instantiate()
	add_child(instance_stafety)
func stafeta_skoncila():
	Dialogic.start("res://dialogicYap/Chapter 3/boss_vyhra.dtl")
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
func _on_timeline_ended():
	if (Dialogic.VAR.telak3_1Played == true and Dialogic.VAR.ekonomikaPlayed == false):
		TaskUI.update_task("JDI VEN (KLIKNI NA DVERE)")

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


func _on_button_pressed() -> void:
	if (Dialogic.VAR.telak3_1Played == true and Dialogic.VAR.ekonomikaPlayed == false):
		TaskUI.update_task("JDI DO B209")
	elif (Dialogic.VAR.boss2 == true and Dialogic.VAR.vyzo3Played == false):
		TaskUI.update_task("JDI DO B209")
	SFXManager.play("res://music/dvereotevreni.mp3")

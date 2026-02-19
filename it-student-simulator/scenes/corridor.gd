extends Node2D

const ONDRA_FROZEN_TEX = preload("res://scenes/chudak.png")
const MINIGAME_SCENE = preload("res://scenes/TopeniMinigame.tscn")

func _on_ready() -> void:
	update_ondra_appearance()
func update_ondra_appearance():
	if Dialogic.VAR.get("jezmrzly") == true:
		var ondra_sprite = $Postavy/Ondra
		if ondra_sprite:
			ondra_sprite.texture = ONDRA_FROZEN_TEX
		else:
			pass
func _on_timeline_ended():
	SFXManager.change_music("res://music/normalnihudba.mp3")
	if Dialogic.VAR.zachranaPlayed == true:
		if Dialogic.VAR.minihraHotova == false:
			start_fire_minigame()
func start_fire_minigame():
	var minigame = MINIGAME_SCENE.instantiate()
	add_child(minigame)
	minigame.minigame_success.connect(_on_fire_success)
	minigame.minigame_failed.connect(_on_fire_fail)
	minigame.start_game()
func _on_fire_success():
	print("Uhašeno!")
	Dialogic.VAR.skolaHori = false
	Dialogic.VAR.minihraHotova = true
	Dialogic.start("res://dialogicYap/Chapter 2/zachrana_vyhra.dtl")
	TaskUI.update_task("VRAT SE DO TRIDY")
	#tady pak spustit dialog (uff to bylo tesne)
func _on_fire_fail():
	print("Škola hoří!")
	Dialogic.VAR.skolaHori = true
	Dialogic.VAR.minihraHotova = true
	Dialogic.start("res://dialogicYap/Chapter 2/zachrana_prohra.dtl")
	TaskUI.update_task("NAJDI NOUZOVY VYCHOD.")
	#tady spustim apokalypsu

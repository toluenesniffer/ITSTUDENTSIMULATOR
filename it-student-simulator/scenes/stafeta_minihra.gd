extends Node2D

@onready var bezci = [$Bezec1, $Bezec2, $Bezec3, $Bezec4, $Bezec5]
@onready var cas_label = $Casomira

var aktualni_rychlost : float = 0.0
var zpomaleni : float = 150.0
var zrychleni : float = 50.0
var max_rychlost : float = 400.0

var aktualni_index : int = 0
var ceka_na_predavku : bool = false
var posledni_klavesa : String = ""

var smer : int = -1
var bod_otocky : float = 150.0
var bod_predavky : float = 900.0

var zbyvajici_cas : float = 60.0
var hra_bezi : bool = true

func _process(delta: float) -> void:
	if hra_bezi:
		zbyvajici_cas -= delta
		if zbyvajici_cas <= 0:
			zbyvajici_cas = 0
			hra_bezi = false
			cas_label.text = "Konec času! Prohráls!"
			return
		cas_label.text = "Čas: " + str(snapped(zbyvajici_cas, 0.01)) + " s"
	else:
		return
	aktualni_rychlost -= zpomaleni * delta
	if aktualni_rychlost < 0:
		aktualni_rychlost = 0
	if not ceka_na_predavku:
		if Input.is_action_just_pressed("mash_left") and posledni_klavesa != "left":
			aktualni_rychlost += zrychleni
			posledni_klavesa = "left"
		elif Input.is_action_just_pressed("mash_right") and posledni_klavesa != "right":
			aktualni_rychlost += zrychleni
			posledni_klavesa = "right"
	aktualni_rychlost = clamp(aktualni_rychlost, 0, max_rychlost)
	var aktivni_bezec = bezci[aktualni_index]
	if not ceka_na_predavku:
		aktivni_bezec.position.x += aktualni_rychlost * delta * smer
		if smer == -1 and aktivni_bezec.position.x <= bod_otocky:
			aktivni_bezec.position.x = bod_otocky
			smer = 1
			aktualni_rychlost = 0
			aktivni_bezec.flip_h = true
		elif smer == 1 and aktivni_bezec.position.x >= bod_predavky:
			aktivni_bezec.position.x = bod_predavky
			aktualni_rychlost = 0
			aktivni_bezec.flip_h = false
			if aktualni_index == 4:
				hra_bezi = false
				cas_label.text = "VÍTĚZSTVÍ! Zbývá: " + str(snapped(zbyvajici_cas, 0.01)) + "s"
			else:
				ceka_na_predavku = true
				smer = -1
	if ceka_na_predavku and Input.is_action_just_pressed("handoff"):
		ceka_na_predavku = false
		posledni_klavesa = " "
		aktualni_index += 1

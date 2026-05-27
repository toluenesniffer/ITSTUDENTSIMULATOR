extends CanvasLayer

const PREKAZKA_SCENA = preload("res://scenes/sloupecky.tscn")
@onready var bezec = $Bezec
@onready var casovac = $CasovacPrekazek
@onready var skore_label = $Control/SkoreLabel
@onready var zprava_label = $Control/ZpravaLabel


@onready var restart_button = $Control2/Restart
@onready var pokracovat_button = $Control2/Pokracovat

var skore = 0
var hra_bezi = false
var cilove_skore = 10

func _ready() -> void:
	add_to_group("HraRoot")
	bezec.position = Vector2(200, 300)
	bezec.aktivni = false
	casovac.stop()
	skore_label.text = "Skóre: 0"
	zprava_label.text = "Zmáčkni MEZERNÍK pro start"
	zprava_label.show()
	set_process_unhandled_input(false)
	restart_button.hide()
	pokracovat_button.hide()
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		if not hra_bezi and not restart_button.visible and not pokracovat_button.visible:
			start_hry()
		else:
			pass
func start_hry():
	hra_bezi = true
	bezec.aktivni = true
	bezec.velocity.y = bezec.JUMP_VELOCITY
	casovac.start()
	zprava_label.hide()
	restart_button.hide()
	pokracovat_button.hide()
	
	skore = 0
	skore_label.text = "Skóre: 0"
	for p in $Prekazky.get_children():
		p.queue_free()
func konec_hry():
	hra_bezi = false
	bezec.aktivni = false
	casovac.stop()
	restart_button.show()
	pokracovat_button.show()
	zprava_label.text = "Laravel tě dostal."
	zprava_label.show()
func _on_casovac_prekazek_timeout() -> void:
	var p = PREKAZKA_SCENA.instantiate()
	var nahodna_vyska = randf_range(250, 850)
	p.position = Vector2(1200, nahodna_vyska)
	$Prekazky.add_child(p)
	p.get_node("Horni").body_entered.connect(_on_kolize_s_prekazkou)
	p.get_node("Dolni").body_entered.connect(_on_kolize_s_prekazkou)
	p.get_node("Bodovani").body_entered.connect(_on_pridat_skore)
func _on_kolize_s_prekazkou(body):
	if body == bezec:
		konec_hry()
func _on_pridat_skore(body):
	if body == bezec and hra_bezi:
		skore += 1
		skore_label.text = "Skóre: " + str(skore)
func _process(_delta: float) -> void:
	if hra_bezi:
		if bezec.position.y > 1100:
			konec_hry()

func _on_restart_pressed() -> void:
	skore = 0
	bezec.position = Vector2(200, 300)
	for p in $Prekazky.get_children():
		p.queue_free()
	start_hry()


func _on_pokracovat_pressed() -> void:
	if get_parent().has_method("minihra_skoncila"):
		get_parent().minihra_skoncila()
	queue_free() 

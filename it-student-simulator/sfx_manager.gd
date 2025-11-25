extends Node

@onready var player = $Player
@onready var music_player = $MusicPlayer

var current_music = ""

func play(sound_path: String):
	var sound = load(sound_path)
	player.stream = sound
	player.play()
func play_preloaded(sound):
	player.stream = sound
	player.play()
func play_music(music_path: String):
	if current_music == music_path and music_player.playing:
		print("Hudba už hraje, přeskakuji...")
		return
	print("Spouštím hudbu: ", music_path)
	stop_music()
	await get_tree().create_timer(0.1).timeout
	var music = load(music_path)
	music_player.stream = music
	music_player.play()
	current_music = music_path
func stop_music():
	if music_player.playing:
		music_player.stop()
	current_music = ""
func change_music(music_path: String):
	music_player.stop()
	await get_tree().create_timer(0.1).timeout
	play_music(music_path)

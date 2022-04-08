extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var _PA1 = $PerimeterActivity1
onready var _PA2 = $PerimeterActivity2
onready var _PA3 = $PerimeterActivity3
onready var _A1 = $Area1
onready var _A2 = $Area2
onready var _A3 = $Area3
onready var _VA1 = $VolumeActivity1
onready var _VA2 = $VolumeActivity2
onready var _VA3 = $VolumeActivity3

var L1 = []
var L2 = []
var L3 = []

# Called when the node enters the scene tree for the first time.
func _ready():
	L1 = get_tree().get_nodes_in_group("Level1")
	L2 = get_tree().get_nodes_in_group("Level2")
	L3 = get_tree().get_nodes_in_group("Level3")
	


func save_scene():
	var packed_scene = PackedScene.new()
	packed_scene.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://src/StartUpScreen/AdvancedMap.tscn", packed_scene)
	

func _on_PerimeterActivity1_pressed():
	for button in L1:
		button.disabled = true
	save_scene()


func _on_Area1_pressed():
	pass # Replace with function body.


func _on_VolumeActivity1_pressed():
	pass # Replace with function body.
	



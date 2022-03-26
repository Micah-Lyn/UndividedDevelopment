extends Node2D

var selected = false
var rest_point
var rest_nodes = []

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	rest_point = rest_nodes[0].global_position
	rest_nodes[0].select()

# checks for mouse click
func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		if _is_top():
			selected = true

func _is_top():
	for node in get_tree().get_nodes_in_group("nodes"):
		if node.get_index() > get_index():
			return false
	return true
# physics for icon to follow the mouse
func _physics_process(delta):
	if selected:
		global_position =  lerp(global_position, get_global_mouse_position(), 25 * delta)
	else:
		global_position = lerp(global_position, rest_point, 2 * delta)	
		
# movement of the sprite after mouse unclick
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
			var shortest_dist = 75
			for child in rest_nodes:
				var distance = global_position.distance_to(child.global_position)
				if distance < shortest_dist:
						child.select()
						rest_point = child.global_position
						shortest_dist = distance
						

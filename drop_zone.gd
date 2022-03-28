extends Position2D


func _draw():
	draw_circle(Vector2.ZERO, 20, Color.transparent)
	
func select():
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
	modulate = Color.webmaroon
	
func deselect():
	modulate = Color.whitesmoke

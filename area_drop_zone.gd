extends Position2D


func _draw():
	draw_rect(Rect2(Vector2(-50, -50), Vector2(100, 100)), Color.red, false, 5)
	
func select():
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
	modulate = Color.webmaroon
	
func deselect():
	modulate = Color.whitesmoke

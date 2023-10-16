function ds_grid_add_item(){

	var _grid = Obj_inventario.grid_items;
	var _chegagem = 0;
	while _grid[# infos.item, _chegagem] != -1
	{
		_chegagem++;
	}
	_grid[# 0, _chegagem] = argument[0];
	_grid[# 1, _chegagem] = argument[1];
	_grid[# 2, _chegagem] = argument[2];
}
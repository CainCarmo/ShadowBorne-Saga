inven = false;
escala = 3;

comeco_x = 15 * escala;
comeco_y = 24 * escala;

slots_h = 8;
slots_v = 3;

total_slots = slots_h * slots_v;

tamanho_slots = 16 * escala;
buffer = 1* escala;

inven_l = sprite_get_width(hub) * escala;
inven_a = sprite_get_height(hub) * escala;

item_select = -1;
pos_select = -1;

enum feiticos 
{
	mag1,
	mag2,
	mag3,
	altura

}

enum itens_inimigos
{
	parteSlime,
	orcCapacete,
	orcDente,
	altura
}

enum infos
{
	item,
	quant,
	Sprite,
	altura
}

grid_items = ds_grid_create(infos.altura, total_slots);
ds_grid_set_region(grid_items, 0, 0, infos.altura - 1, total_slots - 1, -1);

ds_grid_add_item(feiticos.mag1, 1, itens_player);
ds_grid_add_item(feiticos.mag1, 1, itens_player);
ds_grid_add_item(feiticos.mag2, 1, itens_player);
ds_grid_add_item(feiticos.mag3, 1, itens_player);
ds_grid_add_item(itens_inimigos.parteSlime, 4, spr_items_inimigos_strip3);
ds_grid_add_item(itens_inimigos.parteSlime, 6, spr_items_inimigos_strip3);
ds_grid_add_item(itens_inimigos.orcCapacete, 4, spr_items_inimigos_strip3);
ds_grid_add_item(itens_inimigos.orcDente, 4, spr_items_inimigos_strip3);

/*
//primeiro slot
grid_items[# infos.item, 0] = feiticos.mag1;
grid_items[# infos.quant, 0] = 1;
//segundo slot
grid_items[# infos.item, 1] = feiticos.mag2;
grid_items[# infos.quant, 1] = 1;
//terceiro slot
grid_items[# infos.item, 2] = feiticos.mag3;
grid_items[# infos.quant, 2] = 1;
//quinto slot*/

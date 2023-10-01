 var _sprt = sprite_get_width(SpriteHeart) * 2;
var _buffer = 20;
var _vida = ObjPlayer.vida;

for (var i = 0; i < _vida; i++)
{
	draw_sprite_ext(SpriteHeart, 0, 20 + (_sprt * i) + (_buffer * i), 20, 2, 2, 0, c_white, 1);
	
}
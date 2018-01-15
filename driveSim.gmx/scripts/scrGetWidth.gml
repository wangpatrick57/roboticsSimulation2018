///gets width of a sprite
var temp = instance_create(-50, -50, argument0);
var width = temp.sprite_width;

with (temp) {
    instance_destroy();
}

return width;

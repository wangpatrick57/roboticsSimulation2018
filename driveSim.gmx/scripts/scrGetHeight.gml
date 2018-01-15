///gets height of a sprite
var tempCube = instance_create(-50, -50, argument0);
var tempHeight = tempCube.sprite_height;

with (tempCube) {
    instance_destroy();
}

return tempHeight;

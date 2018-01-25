///decrease distance
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var playerId = argument4;

var trail = ds_list_create();
var initial = instance_create(x1, y1, objPoint);
ds_list_add(trail, initial);
var pos = scrStep(x1, y1, x1, y1, x2, y2, playerId);
ds_list_add(trail, pos);
var prevPos = instance_create(x1, y1, objPoint);

while (pos.x != x2 || pos.y != y2) {
    var cX = pos.x;
    var cY = pos.y;
    pos = scrStep(prevPos.x, prevPos.y, cX, cY, x2, y2, playerId);
    ds_list_add(trail, pos);
    prevPos.x = cX;
    prevPos.y = cY;
}

return trail;

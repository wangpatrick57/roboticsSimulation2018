///step
var prevX = argument0;
var prevY = argument1;
var inputX = argument2;
var inputY = argument3;
var destX = argument4;
var destY = argument5;
var playerId = argument6;
var ret = instance_create(inputX, inputY, objPoint);
var dPos;
var rllyBig = 999999;

if (scrValid(inputX - 1, inputY, playerId) && prevX != (inputX - 1)) {
    dPos[0] = point_distance(inputX - 1, inputY, destX, destY);
} else {
    dPos[0]= rllyBig;
}

if (scrValid(inputX + 1, inputY, playerId) && prevX != (inputX + 1)) {
    dPos[1] = point_distance(inputX + 1, inputY, destX, destY);
} else {
    dPos[1]= rllyBig;
}

if (scrValid(inputX, inputY + 1, playerId) && prevX != (inputY + 1)) {
    dPos[2] = point_distance(inputX, inputY + 1, destX, destY);
} else {
    dPos[2]= rllyBig;
}

if (scrValid(inputX, inputY - 1, playerId) && prevX != (inputY - 1)) {
    dPos[3] = point_distance(inputX, inputY - 1, destX, destY);
} else {
    dPos[3]= rllyBig;
}

var minimum = dPos[0];

for(var i = 1; i < 4; i++){
    if(dPos[i] < minimum) {
        minimum = dPos[i];
    }
}

for(var i = 0; i < 4; i++){
    if(dPos[i] == minimum){
        if(i == 0) {
            ret.x = ret.x - 1;
        } else if (i == 1) {
            ret.x = ret.x + 1;
        } else if (i == 2) {
            ret.y = ret.y + 1;
        } else if (i == 3) {
            ret.y = ret.y - 1;
        }
        
        return ret;
    }
}

return ret;

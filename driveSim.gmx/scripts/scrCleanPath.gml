///clean path
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var playerId = argument4;

var steps = point_distance(x1, y1, x2, y2);
var xC = (x2 - x1) / steps;
var yC = (y2 - y1) / steps;

for (var i = 0; i < steps; i++) {
    var xN = x1 + xC * i;
    var yN = y1 + yC * i;
    
    if (!scrValid(xN, yN, playerId)) {
        return false;
    }
}

if (board[x2, y2] == 1) {
    return false;
}

return true;

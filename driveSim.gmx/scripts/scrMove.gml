///scrMove
var moverId = argument0;
var startXPos = argument1;
var startYPos = argument2;
var tryXPos = startXPos;
var tryYPos = startYPos;
var maxDXPos = argument3;
var maxDYPos = argument4;
var step = 0.3;
var xStep = step * sign(maxDXPos);
var yStep = step * sign(maxDYPos);
var totalDXPos = 0;
var totalDYPos = 0;

while (abs(totalDXPos) < abs(maxDXPos) && !place_meeting(tryXPos + xStep+1, tryYPos, objBlock)) {
tryXPos += xStep;
totalDXPos += xStep;
}

while (abs(totalDYPos) < abs(maxDYPos) && !place_meeting(tryXPos, tryYPos - yStep-1, objBlock)) {
tryYPos -= yStep;
totalDYPos -= yStep;
}

var tryPos;
tryPos[0] = tryXPos;
tryPos[1] = tryYPos;

return tryPos;


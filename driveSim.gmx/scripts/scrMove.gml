///scrMove
var moverId = argument0;
var startXPos = argument1;
var startYPos = argument2;
var tryXPos = startXPos;
var tryYPos = startYPos;
var maxDXPos = argument3;
var maxDYPos = argument4;
var hyp = sqrt(maxDXPos * maxDXPos + maxDYPos * maxDYPos);
var xStep = maxDXPos / hyp;
var yStep = maxDYPos / hyp;
var totalDXPos = 0;
var totalDYPos = 0;

while (abs(totalDXPos) < abs(maxDXPos) && !place_meeting(tryXPos + 2 * xStep, tryYPos, objBlock)) {
    tryXPos += xStep;
    totalDXPos += xStep;
}

while (abs(totalDYPos) < abs(maxDYPos) && !place_meeting(tryXPos, tryYPos - 2 * yStep, objBlock)) {
    tryYPos -= yStep;
    totalDYPos -= yStep;
}

scrGetOutOfBlock();
var tryPos;
tryPos[0] = tryXPos;
tryPos[1] = tryYPos;

return tryPos;


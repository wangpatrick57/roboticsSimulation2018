///scrDriveSim
var thr = argument0;
var stw = argument1;
var dEnc = argument2;
var dHPos;
var dVPos;
var dDir;

//the actual driveSim function later

//fake driveSim function for testing before we get the actual one
dHPos = 0;
dVPos = thr * currTopSpd;

if (abs(stw) < abs(angleGrace)) {
dDir = 0;
} else {
dDir = (stw + -1 * sign(stw) * angleGrace) * baseTurnSpd;
}

var output;
output[0] = dHPos;
output[1] = dVPos;
output[2] = dDir;
return output;
///@desc scrDriveSim
var thr = argument0;
var stw = argument1;
var dEnc = argument2;
var dir = argument3;
var dHPos;
var dVPos;
var dDir;

//the actual driveSim function later

//fake driveSim function for testing before we get the actual one
dHPos = 0;
dVPos = thr * currTopSpd;

if (abs(stw) < abs(angleGrace)) {
dDir = 0;
} else {
dDir = (stw + -1 * sign(stw) * angleGrace) * baseTurnSpd;
}

var output;
output[0] = dHPos;
output[1] = dVPos;
output[2] = dDir;
return output;


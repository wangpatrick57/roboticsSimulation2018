///scrGetInput
var objectId = argument0;
var controlScheme = argument1;
var thr; //between -1 and 1
var stw; //between -90 and 90
var pickUp;
var putDown;
//var valueThrust=joystick_ypos(1);
//thr=-valueThrust;
if (controlScheme == "irl") {
    //do later
} else if (controlScheme == "km") {
    //thrust (keyboard)
    var one = keyboard_check_direct(ord("1"));
    var two = keyboard_check_direct(ord("2"));
    var three = keyboard_check_direct(ord("3"));
    var four = keyboard_check_direct(ord("4"));
    pickUp = keyboard_check_direct(ord("C"));
    var thrTotal = 0;
    var numPressed = 0;
    
    if (one) {
        thrTotal += -1;
        numPressed++;
    }
    
    if (two) {
        thrTotal += -1 / 2;
        numPressed++;
    }
    
    if (three) {
        thrTotal += 1 / 2;
        numPressed++;
    }
    
    if (four) {
        thrTotal += 1;
        numPressed++;
    }
    
    if (numPressed != 0) {
        thr = thrTotal / numPressed;
    } else {
        thr = 0;
    }
    
    //thr with mouse
    //thr = point_distance(room_width / 2, room_height, mouse_x, mouse_y) / point_distance(0, 0, room_width, room_height);
    
    //steering wheel (mouse)
    
    if (mouse_check_button(mb_left)) {
        stw = 0;
    } else {
        var tempY = mouse_y;
        
        if (tempY > room_height) {
            tempY = room_height;
        }
        
        stw = point_direction(room_width / 2, room_height, mouse_x, tempY) - 90;
    }
} else if (controlScheme == "ko") {
    pickUp = keyboard_check_direct(ord("E"));
    
    if (keyboard_check_direct(ord("W"))) {
        thr = 3 / 4;
    } else if (keyboard_check_direct(ord("S"))) {
        thr = -3 / 4;
    } else {
        thr = 0;
    }
    
    if (keyboard_check_direct(ord("A"))) {
        stw = 90;
    } else if (keyboard_check_direct(ord("D"))) {
        stw = -90;
    } else {
        stw = 0;
    }
} else if (controlScheme == "mo") {
    pickUp = mouse_check_button(mb_right);

    if (mouse_check_button(mb_left)) {
        thr = 3 / 4;
    } else {
        thr = 0;
    }
    
    var angleToMouse = point_direction(robotId.xPos, robotId.yPos, mouse_x, mouse_y);
    var robotAngle = robotId.image_angle;
    var grace = 10;
    var stwSign = 0;
    var diffAngle = robotAngle - angleToMouse;
    
    /*if (total < 180) {
        if (angleToMouse > robotAngle) {
            stwSign = -1;
        } else if (angleToMouse < robotAngle) {
            stwSign = 1;
        }
    } else {
        if (angleToMouse > 0) {
            stwSign = -1;
        } else {
            
        }
    }*/
    
    if (dsin(diffAngle) > 0) {
        stwSign = -1;
    } else {
        stwSign = 1;
    }
    
    stw = stwSign * 90;
} else if (controlScheme == "kr") {
    pickUp = keyboard_check_direct(vk_shift);
    
    if (keyboard_check_direct(vk_up)) {
        thr = 3 / 4;
    } else if (keyboard_check_direct(vk_down)) {
        thr = -3 / 4;
    } else {
        thr = 0;
    }
    
    if (keyboard_check(vk_left)) {
        stw = 90;
    } else if (keyboard_check(vk_right)) {
        stw = -90;
    } else {
        stw = 0;
    }
} else {
    show_debug_message("you entered the wrong thing for controlScheme");
}

if (robotId.side == "r") {
   var thisNumber = -1;

    if (keyboard_check_pressed(ord("1"))) {
        thisNumber = 0;
    } else if (keyboard_check_pressed(ord("2"))) {
        thisNumber = 1;
    } else if (keyboard_check_pressed(ord("3"))) {
        thisNumber = 2;
    }
    
    if (thisNumber != -1 && redLockedOut[thisNumber]) {
        thisNumber = -1;
    }
    
    if (thisNumber != -1) {
        if (redExchangeCube) {
            if (redPowerUp[thisNumber] < 3) {
                redAddedCube.type = thisNumber;
                redAddedCube.num = ds_list_find_index(cubeIds, redExchangeCubeId);
            }
        } else {
            if (redPowerUp[thisNumber] > 0) {
                activatedPowerup.type = thisNumber;
                activatedPowerup.side = "r";
            } else {
                activatedPowerup.type = 255;
                activatedPowerup.side = "none";
            }
        }
    }
    
    if (!redExchangeCube) {
        redAddedCube.type = 255;
        redAddedCube.num = -1;
    }
} else if (robotId.side == "b") {
    var thisNumber = -1;

    if (keyboard_check_pressed(ord("8"))) {
        thisNumber = 0;
    } else if (keyboard_check_pressed(ord("9"))) {
        thisNumber = 1;
    } else if (keyboard_check_pressed(ord("0"))) {
        thisNumber = 2;
    }
    
    if (thisNumber != -1 && blueLockedOut[thisNumber]) {
        thisNumber = -1;
    }
    
    if (thisNumber != -1) {
        if (blueExchangeCube) {
            if (bluePowerUp[thisNumber] < 3) {
                blueAddedCube.type = thisNumber;
                blueAddedCube.num = ds_list_find_index(cubeIds, blueExchangeCubeId);
            }
        } else {
            if (bluePowerUp[thisNumber] > 0) {
                activatedPowerup.type = thisNumber;
                activatedPowerup.side = "b";
            } else {
                activatedPowerup.type = 255;
                activatedPowerup.side = "none";
            }
        }
    }
    
    if (!blueExchangeCube) {
        blueAddedCube.type = 255;
        blueAddedCube.num = -1;
    }
}

//var stw=gamepad_axis_value(0,gp_axisrv)*pi/2;
var output;
output[0] = thr;
output[1] = stw;
output[2] = pickUp;
return output;


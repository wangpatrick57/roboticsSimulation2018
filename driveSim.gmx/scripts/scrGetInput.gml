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
        thr = 1 / 2;
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
    
    /*if(keyboard_check_pressed(ord("1"))){
        if(redExchangeCube){
            if(redPowerUp[0]<4){
                if(powerup!="redForce"){
                    redPowerUp[0]++;
                    redScore+=5;
                    redExchangeCube=false;
                    redForce.image_index++;
                }
            }
        }else{
            if(redPowerUp[0]>0){
                if((powerup=="blueBoost"||powerup=="blueForce")&&inQueue=="none"){
                    inQueue="redForce";
                    
                } else if (!powerup=="none"){
                    powerup="redForce";
                }
            }
        }
    }
     if(keyboard_check_pressed(ord("2"))){
        if(redExchangeCube){
            if(redPowerUp[1]<4){
                if(powerup!="redBoost"){
                    redPowerUp[1]++;
                    redScore+=5;
                    redExchangeCube=false;
                    redBoost.image_index++;
                }
            }
        }else{
            if(redPowerUp[1]>0){
                if((powerup=="blueForce"||powerup=="blueBoost")&&inQueue=="none"){
                    inQueue="redBoost";
                }else if(!powerup=="blueForce"&&!powerup=="blueBoost"){
         
                    powerup="redBoost";
                }
            }
        }
    }
     if(keyboard_check_pressed(ord("3"))){
        if(redExchangeCube){
            if(redPowerUp[2]<4){
                redPowerUp[2]++;
                redScore+=5;
                redExchangeCube=false;
                redLevitate.image_index++;
            }
        }
        if(redPowerUp[2]==3){
            redScore+=25;
        }
    }*/
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
    
    if(keyboard_check_pressed(ord("8"))){
        if(blueExchangeCube){
            if(bluePowerUp[0]<4){
                if(powerup!="blueForce"){
                    bluePowerUp[0]++;
                    blueScore+=5;
                    blueExchangeCube=false;
                    blueForce.image_index++;
                }
            }
        }else{
            if(bluePowerUp[0]>0){
                if((powerup=="redBoost"||powerup=="redForce")&&inQueue=="none"){
                    inQueue="blueForce";
                    
                }
                else if(!powerup=="none"){
                    powerup="blueForce";
                }
                
            }
        }
    }
     if(keyboard_check_pressed(ord("9"))){
        if(blueExchangeCube){
            if(bluePowerUp[1]<4){
                if(powerup!="blueBoost"){
                    bluePowerUp[1]++;
                    blueScore+=5;
                    blueExchangeCube=false;
                    blueBoost.image_index++;
                }
            }
        }else{
            if(bluePowerUp[1]>0){
                if((powerup=="redBoost"||powerup=="redForce")&&inQueue=="none"){
                    inQueue="blueBoost";
                }else if(!powerup=="redBoost"&&!powerup=="redForce"){
                    powerup="blueBoost";
                }
            }
        }
    }
    if(keyboard_check_pressed(ord("0"))){
        if(blueExchangeCube){
            if(bluePowerUp[2]<4){
                bluePowerUp[2]++;
                blueScore+=5;
                blueExchangeCube=false;
                blueLevitate.image_index++;
            }
        }
        if(bluePowerUp[2]==3){
            blueScore+=25;
        }
    }
} else if (controlScheme == "kr") {
    pickUp = keyboard_check_direct(ord("L"));
    
    if (keyboard_check_direct(vk_up)) {
        thr = 3 / 4;
    } else if (keyboard_check_direct(vk_down)) {
        thr = 1 / 2;
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
    
    if(keyboard_check_pressed(ord("B"))){
        if(blueExchangeCube){
            if(bluePowerUp[0]<4){
                if(powerup!="blueForce"){
                    bluePowerUp[0]++;
                    blueScore+=5;
                    blueExchangeCube=false;
                    blueForce.image_index++;
                }
            }
        }else{
            if(bluePowerUp[0]>0){
                if((powerup=="redBoost"||powerup=="redForce")&&inQueue=="none"){
                    inQueue="blueForce";
                    
                }
                else if(!powerup=="none"){
                    powerup="blueForce";
                }
                
            }
        }
    }
     if(keyboard_check_pressed(ord("N"))){
        if(blueExchangeCube){
            if(bluePowerUp[1]<4){
                if(powerup!="blueBoost"){
                    bluePowerUp[1]++;
                    blueScore+=5;
                    blueExchangeCube=false;
                    blueBoost.image_index++;
                }
            }
        }else{
            if(bluePowerUp[1]>0){
                if((powerup=="redBoost"||powerup=="redForce")&&inQueue=="none"){
                    inQueue="blueBoost";
                }else if(!powerup=="redBoost"&&!powerup=="redForce"){
                    powerup="blueBoost";
                }
            }
        }
    }
    if(keyboard_check_pressed(ord("M"))){
        if(blueExchangeCube){
            if(bluePowerUp[2]<4){
                bluePowerUp[2]++;
                blueScore+=5;
                blueExchangeCube=false;
                blueLevitate.image_index++;
            }
        }
        if(bluePowerUp[2]==3){
            blueScore+=25;
        }
    }
} else {
    show_debug_message("you entered the wrong thing for controlScheme");
}

if (robotId.side == "red") {
    var thisNumber = -1;

    if (keyboard_check_direct(ord("1"))) {
        thisNumber = 0;
        /*var thisSide = robotId.side;
        var thisExchangeCube;
        var thisExchangeCubeId;
        var thisPowerUp;
        var thisAddedCube;
        
        if (thisSide == "red") {
            thisExchangeCube = redExchangeCube;
            thisPowerUp = redPowerUp;
            thisAddedCube = redAddedCube;
            thisExchangeCubeId = redExchangeCubeId;
        }*/
    } else if (keyboard_check_direct(ord("2"))) {
        thisNumber = 1;
    } else if (keyboard_check_direct(ord("3"))) {
        thisNumber = 2;
    }
    
    if (thisNumber != -1) {
        if (redExchangeCube) {
            if (redPowerUp[thisNumber] < 3) {
                redAddedCube.typeNum = thisNumber;
                redAddedCube.cubeId = redExchangeCubeId;
            }
        } else {
            
        }
    }
}

//var stw=gamepad_axis_value(0,gp_axisrv)*pi/2;
var output;
output[0] = thr;
output[1] = stw;
output[2] = pickUp;
return output;


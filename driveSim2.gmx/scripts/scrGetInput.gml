///scrGetInput
var objectId = argument0;
var controlScheme = argument1;
var thr; //between -1 and 1
var stw; //between -90 and 90
var pickUp;
var putDown;



if (controlScheme == "irl") {
    //do later
} else if (controlScheme == "km") {
    //thrust (keyboard)
    var one = keyboard_check_direct(ord("1"));
    var two = keyboard_check_direct(ord("2"));
    var three = keyboard_check_direct(ord("3"));
    var four = keyboard_check_direct(ord("4"));
    pickUp = keyboard_check_direct(ord("C"));
    putDown = keyboard_check_direct(ord("V"));
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
    putDown = keyboard_check_direct(ord("Q"));
    
    if (keyboard_check_direct(ord("W"))) {
        thr = 3 / 4;
    } else if (keyboard_check_direct(ord("S"))) {
        thr = 1 / 2;
    } else {
        thr = 0;
    }
    
    if (keyboard_check(ord("A"))) {
        stw = 90;
    } else if (keyboard_check(ord("D"))) {
        stw = -90;
    } else {
        stw = 0;
    }
    if(keyboard_check_pressed(ord("1"))){
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
                    
                }
                else if(!powerup=="none"){
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
    }
    


    with (robotId) {
        if(place_meeting(x,y,objExchange)){
            
        }
    }
    
} else if (controlScheme == "mo") {
    pickUp = keyboard_check_direct(ord("O"));
    putDown = keyboard_check_direct(ord("P"));

    if (mouse_check_button(mb_left)) {
        thr = 3 / 4;
    } else if (mouse_check_button(mb_right)) {
        thr = 1 / 2;
    } else {
        thr = 0;
    }
    
    var angleToMouse = point_direction(robotId.xPos, robotId.yPos, mouse_x, mouse_y);
    var robotAngle = robotId.image_angle;
    var grace = 10;
    var stwSign = 0;
    var diffAngle = robotAngle - angleToMouse;
    
    
    
    if (dsin(diffAngle) > 0) {
        stwSign = -1;
    } else {
        stwSign = 1;
    }
    
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
} else {
    show_debug_message("you entered the wrong thing for controlScheme");
}
var valueThrust=joystick_ypos(2);

//stw=gamepad_axis_value(0,gp_axisrv)*pi/2;

//thr=-valueThrust;

var output;
output[0] = thr;
output[1] = stw;
output[2] = pickUp;
output[3] = putDown;
return output;


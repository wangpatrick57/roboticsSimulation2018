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
        stw = point_direction(room_width / 2, room_height, mouse_x, mouse_y) - 90;
    }
} else {
    show_debug_message("you entered the wrong thing for controlScheme");
}

//var stw=gamepad_axis_value(0,gp_axisrv)*pi/2;
var output;
output[0] = thr;
output[1] = stw;
output[2] = pickUp;
output[3] = putDown;
return output;


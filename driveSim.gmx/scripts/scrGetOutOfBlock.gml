///@desc get out of block
var startX = x;
var startY = y;
var i = 0;

while (place_meeting(x, y, objBlock)) {
    if (i % 4 == 0) {
        x = startX + i / 4;
        y = startY;
    } else if (i % 4 == 1) {
        x = startX - i / 4;
        y = startY;
    } else if (i % 4 == 2) {
        x = startX;
        y = startY + i / 4;
    } else {
        x = startX;
        y = startY - i / 4;
    }

    i++;
}

preciseX = x;
preciseY = y;

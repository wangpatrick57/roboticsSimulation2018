lx=random(room_width);
globalvar cVertical1;

cVertical1=instance_create(lx,sprite_height,objCannon);

with(cVertical1){
    vertical=true;
}

globalvar cHorizontal1;

ly=random(room_height)
cHorizontal1=instance_create(sprite_width,ly,objCannon);

with(cHorizontal1){
    vertical=false;
}


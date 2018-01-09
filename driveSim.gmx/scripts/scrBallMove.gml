dx=argument0;
dy=argument1;

xi=x;
yi=y;
distance=sqrt(dy*dy+dx*dx);

unitDx=dx/distance;
unitDy=dy/distance;



    while(abs(x-xi)<abs(dx)||abs(y-yi)<abs(dy)){
        if(!place_meeting(x,y,objBlock)||!place_meeting(x,y,objBall)){
            if(abs(x-xi)<abs(dx)){
                x=x+unitDx;
            }
            if(abs(y-yi)<abs(dy)){
                y=y-unitDy;
            }
        }else{
            bounce=true;
            break;
        }
        
    }
    



///valid
var checkX = argument0;
var checkY = argument1;
var playerId = argument2;
var angleDiff = 5;

for (var d = 0; d < 360; d += angleDiff) {
    var tempX = checkX + robotSize * dcos(d);
    var tempY = checkY - robotSize * dsin(d);
    var arrayX = tempX / chunkSize;
    var arrayY = tempY / chunkSize;
    
    if (arrayX >= 0 && arrayX < array_length_2d(collisionArray, 0) && arrayY >= 0 && arrayY < array_height_2d(collisionArray)) {
        if (collisionArray[tempY / chunkSize, tempX / chunkSize] == 1) {
            return false;
        }
    }
}

return true;

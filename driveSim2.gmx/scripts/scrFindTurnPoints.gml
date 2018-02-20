///find turn points
var path = argument0;
var playerId = argument1;
var turnPoints = ds_list_create();
ds_list_add(turnPoints, ds_list_find_value(path, 0));
var doUntil = 0;

while (doUntil < (ds_list_size(path) - 1)) {
    doUntil++;
    var cPoint = ds_list_find_value(turnPoints, ds_list_size(turnPoints) - 1);
    var cPoint0 = ds_list_find_value(cPoint, 0);
    var cPoint1 = ds_list_find_value(cPoint, 1);
    var pathUntil = ds_list_find_value(path, doUntil);
    var pathUntil0 = ds_list_find_value(pathUntil, 0);
    var pathUntil1 = ds_list_find_value(pathUntil, 1);
    
    if (!scrCleanPath(cPoint0, cPoint1, pathUntil0, pathUntil1, playerId)) {
        ds_list_add(turnPoints, ds_list_find_value(path, doUntil - 1));
    }
}

ds_list_add(turnPoints, ds_list_find_value(path, ds_list_size(path) - 1));
return turnPoints;

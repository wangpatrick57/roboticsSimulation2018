///scrRound
//cuz game maker uses bankers rounding which is round up 0.5 for odd numbers round down 0.5 for even numbers and we need to always round up
var input = argument0;
var output = floor(input);

if (input % 1 >= 0.5) {
	output++;
}

return output;


# frcGame
FRC PowerUp Game README 02/25/18

I am aware of many problems with the game, right now it is just the earliest playable version. If you have any questions or find any bugs, please email wang.patrick57@gmail.com (if the problem isn't in the Known Problems section).

tl;dr (weird/important stuff)
You need the server even if you plan to play on only one computer, however, you can play without internet connection on only one computer by running the game and the server on the same computer and entering 127.0.0.1 as the ip address of the server.
The server is local so you have to run it, and it will be just a gray screen when you run it.
When you get to the screen with the six robots and the done button, if you are playing across multiple computers, do not select a control scheme (WASD, arrow keys, mouse) for the same robot on multiple different computers. The game does not enforce this so be careful.
If your game is "frozen" at the start, it is most likely because the game only starts once you have robots on both the red and blue side.
If there are no switch or scale plates then you're not connected to the server.
1, 2, 3 for powerups for red, 7, 8, 9 for powerups for blue.
Sometimes, a cube can't be picked up. That is because it is barely touching the edge of a scale or switch plate even though it doesn't look like it.
If one computer is really, really slow, the timer and therefore points will not be in sync.
Levitate doesn't do anything because there is no game end yet.
Everything else is mostly intuitive, if something's weird read the rest of the README.

How to Run the Game
In order to play, you need to download both the server and the actual game, even if you plan to play on only one computer.
First, run the server on one computer.
Next, run the game on as many computers as you like, but make sure that they are all connected to the same wifi network as the computer running the server. You may run the game on the same computer as the server.
The game will first ask you to enter the ip address of the computer running the server. To find this on Mac, open Terminal and type "ifconfig en0" if you have a newer computer or "ifconfig en1" if you have an older one. Then, find the ip address after "inet". Not "inet6", just "inet". To find it on Windows, open Command Prompt and type "ipconfig", then look for the address after "IPv4 Address". Afterwards, click Done.
If you have no internet connection, you can still play on one computer by running the server and game on the same computer and entering 127.0.0.1 as the ip address.
Afterwards, select which robots you will control by clicking on the robot positions and selecting the control scheme. The three control schemes are WASD, arrow keys, and mouse. You do not have to have a robot for each control scheme, you do not even have to control any robots if you just want to spectate a game. If you are playing across multiple computers, do not select the same robot on different computers. The game does not enforce this by itself to make sure you have not done this. Afterwards, click Done.
You should be led into a screen that looks like the field from a top down view. If your screen looks something like the image below, it means you have not connected to the server.
	

If your screen looks something like the image below, that means you're good.

Note that the amount of robots is correct in the connected image and the switch and scale plates exist in the connected image.

Gameplay
For the WASD control scheme, WASD to move and E to pick up and put down.
For arrow keys, arrow keys to move and SHIFT to pick up and put down.
For the mouse, LMB to move and RMB to pick up and put down.
For red, 1, 2, and 3 manipulate powerups. For blue, 7, 8, 9.
Once you arrive at a portal, you will automatically pick up a cube.
There is no game end (yet), so either play to a set time or play until there are no more manipulatable cubes.
Levitate doesn't do anything because there is no game end.
You can place cubes in the other team's plate, because that's how the real life game is.
The one inconsistency (that I know of, there are most likely more) between this game and the real life game is that in the real life game, you are allowed to place blocks in powerup slots that you cannot use. You can only use one of each powerup per game, but you can still place blocks inside powerup capsules after that one use for the 5 points. The reason for this inconsistency is because this rule is pretty confusing for players--most of the people I know, including me, did not know about this rule for a long time--so I enforced it in the game.

Known Problems:
No game end
Levitate doesn't work
There is a weird thing in the top left corner
Timers out of sync for computers with different processing speeds
Sometimes, the block in the plate won't look like it's in the plate

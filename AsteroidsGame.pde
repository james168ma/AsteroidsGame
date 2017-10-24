Spaceship playerShip = new Spaceship();
//next make stars
public void setup() {

	size(1000, 1000);
	background(0);

}

public void draw() {

	background(0);
	playerShip.move();
  	playerShip.show();

}

public void keyPressed() {

	if (key == 'w') { playerShip.accelerate(.1); }
    if (key =='a') { playerShip.turn(-5); } 
    if (key == 's') { playerShip.accelerate(-.1); }
	if (key == 'd') { playerShip.turn(5); }
	if (key == 'h') { playerShip.hyperSpace(); }

}


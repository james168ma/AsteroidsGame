//public final static variables
public final static int NUM_ASTEROIDS = 10;
public final static int NUM_STARS = (int)(Math.random()*300) + 300;

//Making new arrays and instances of objects
private Spaceship playerShip = new Spaceship();
private ArrayList <Stars> starField = new ArrayList <Stars>();
private ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();

//Key control variables
private boolean keyWPressed = false;
private boolean keyAPressed = false;
private boolean keySPressed = false;
private boolean keyDPressed = false;
private boolean keyHPressed = false;

public void setup() {

	//initiating size and background
	size(1000, 800);
	background(0);

	//making instances of stars and asteroids
	for(int i = 0; i < NUM_STARS; i++) 
		starField.add(new Stars());

	for(int i = 0; i < NUM_ASTEROIDS; i++) 
		rocks.add(new Asteroid());

}

public void draw() {

	background(0);

	//calling show and move functions
	for(int i = 0; i < starField.size(); i++)
		starField.get(i).show();

	for(int i = 0; i < rocks.size(); i++) {
		rocks.get(i).move();
		rocks.get(i).show();

		//remove asteroid from arraylist if it hits the player's ship
		if(rocks.get(i).distFromShip(playerShip) <= 20) {
			rocks.remove(i);
		}
	}

	playerShip.move();
  	playerShip.show();

  	//calling function to control the ship
  	controlShip(playerShip);

}

//changing boolean values of the keys being pressed to true
public void keyPressed() {

	if (key == 'w') { keyWPressed = true; }
    if (key == 'a') { keyAPressed = true; } 
    if (key == 's') { keySPressed = true; }
	if (key == 'd') { keyDPressed = true; }
	if (key == 'h') { keyHPressed = true; }

}

//changing boolean values of the keys being pressed to false
public void keyReleased() {

	if (key == 'w') { keyWPressed = false; }
    if (key == 'a') { keyAPressed = false; } 
    if (key == 's') { keySPressed = false; }
	if (key == 'd') { keyDPressed = false; }
	if (key == 'h') { keyHPressed = false; }

}

//function to control a ship
public void controlShip(Spaceship ship) {

	if(keyWPressed == true) {

  		ship.accelerate(.1);
  		ship.setAccelerating(true); //to make the jet animation pop up

	} else 
		ship.setAccelerating(false); //to make the jet animation go away
	

  	if(keyAPressed == true)
  		ship.turn(-5);

  	if(keySPressed == true) {

  		ship.accelerate(-.1);

  	}

  	if(keyDPressed == true)
  		ship.turn(5);

  	if(keyHPressed == true) { //hyperspace

  		ship.setX((int)(Math.random() * 1000));
		ship.setY((int)(Math.random() * 800));
		ship.setDirectionX(0);
		ship.setDirectionY(0);
		ship.setPointDirection((int)(Math.random() * 181));
		keyHPressed = false; // to make so that you only teleport once

  	}

}

public Spaceship playerShip = new Spaceship();
public Stars[] starField = new Stars[((int)Math.random()*300) + 300]; 
public boolean keyWPressed = false;
public boolean keyAPressed = false;
public boolean keySPressed = false;
public boolean keyDPressed = false;
public boolean keyHPressed = false;
public void setup() {

	size(1000, 1000);
	background(0);
	for(int i = 0; i < starField.length; i++) 
		starField[i] = new Stars();

}

public void draw() {

	background(0);

	for(int i = 0; i < starField.length; i++)
		starField[i].show();

	playerShip.move();
  	playerShip.show();

  	controlShip(playerShip);

}

public void keyPressed() {

	if (key == 'w') { keyWPressed = true; }
    if (key =='a') { keyAPressed = true; } 
    if (key == 's') { keySPressed = true; }
	if (key == 'd') { keyDPressed = true; }
	if (key == 'h') { keyHPressed = true; }

}

public void keyReleased() {

	if (key == 'w') { keyWPressed = false; }
    if (key =='a') { keyAPressed = false; } 
    if (key == 's') { keySPressed = false; }
	if (key == 'd') { keyDPressed = false; }
	if (key == 'h') { keyHPressed = false; }

}

public void controlShip(Spaceship ship) {

	if(keyWPressed == true)
  		ship.accelerate(.1);
  	if(keyAPressed == true)
  		ship.turn(-5);
  	if(keySPressed == true)
  		ship.accelerate(-.1);
  	if(keyDPressed == true)
  		ship.turn(5);

  	if(keyHPressed == true) {

  		ship.setX((int)(Math.random() * 1000));
		ship.setY((int)(Math.random() * 1000));
		ship.setDirectionX(0);
		ship.setDirectionY(0);
		ship.setPointDirection((int)(Math.random() * 181));

  	}

}


//public final static variables
public final static int SCREEN_SIZE_X = 1000;
public final static int SCREEN_SIZE_Y = 800;
public final static int BIG_A_RADIUS = 40;
public final static int SMALL_A_RADIUS = 20;
public final static int NUM_ASTEROIDS = 10;
public final static int NUM_STARS = (int)(Math.random()*300) + 300;
public final static int MAX_NUM_BULLETS = 50;
public final static int MAX_BULLET_LIFE = 200;

//Making new arrays and instances of objects
private Spaceship playerShip = new Spaceship(500, 400);
private ArrayList <EnemyShip> enemies = new ArrayList <EnemyShip>();
private ArrayList <Stars> starField = new ArrayList <Stars>();
private ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
private ArrayList <Asteroid> smallRocks = new ArrayList <Asteroid>();
private ArrayList <Bullet> bullets = new ArrayList <Bullet>();

//Key control variables
private boolean keyWPressed = false;
private boolean keyAPressed = false;
private boolean keySPressed = false;
private boolean keyDPressed = false;
private boolean keyHPressed = false;
private boolean spacePressed = false;


public void setup() {

	//initiating size and background
	size(1000, 800);
	background(0);

	//making instances of stars and asteroids
	for(int i = 0; i < NUM_STARS; i++) 
		starField.add(new Stars());

	for(int i = 0; i < NUM_ASTEROIDS; i++) 
		rocks.add(new Asteroid());

	//make new enemy
	enemies.add(new EnemyShip());

}


public void draw() {

	background(0);

	//show stars
	for(int i = 0; i < starField.size(); i++)
		starField.get(i).show();

	//do all the asteroid essentials (refer to function below if refresher needed)
	asteroidEssentials(rocks, BIG_A_RADIUS, "big");
	asteroidEssentials(smallRocks, SMALL_A_RADIUS, "small");

	//control, move, and show player's ship
  	controlPlayerShip(playerShip);
	playerShip.move();
  	playerShip.show();

  	//show and move enemy ships
  	for(int i = 0;i < enemies.size(); i++) {

  		enemies.get(i).move(playerShip);
  		enemies.get(i).show();

  	}

  	//show, move, and remove bullets
	for(int i = 0; i < bullets.size(); i++) {

		bullets.get(i).move();
		bullets.get(i).show();

		//for removing bullets so they don't stay forever
		bullets.get(i).setBulletLife(bullets.get(i).getBulletLife()+1);

		if(bullets.get(i).getBulletLife() > MAX_BULLET_LIFE) {
			bullets.remove(i);
			i--;
		}

	}

  	//add new bullets
  	if((spacePressed == true) && (bullets.size() <= MAX_NUM_BULLETS)) 
  		bullets.add(new Bullet(playerShip));

}


//changing boolean values of the keys being pressed to true
public void keyPressed() {

	if (key == 'w') { keyWPressed = true; }
    if (key == 'a') { keyAPressed = true; } 
    if (key == 's') { keySPressed = true; }
	if (key == 'd') { keyDPressed = true; }
	if (key == 'h') { keyHPressed = true; }
	if (key == ' ') { spacePressed = true; }

}


//changing boolean values of the keys being pressed to false
public void keyReleased() {

	if (key == 'w') { keyWPressed = false; }
    if (key == 'a') { keyAPressed = false; } 
    if (key == 's') { keySPressed = false; }
	if (key == 'd') { keyDPressed = false; }
	if (key == 'h') { keyHPressed = false; }
	if (key == ' ') { spacePressed = false; }

}


//function to control a player's ship
public void controlPlayerShip(Spaceship ship) {

	if(keyWPressed == true) {

  		ship.accelerate(.1);
  		ship.setAccelerating(true); //to make the jet animation pop up

	} else 
		ship.setAccelerating(false); //to make the jet animation go away
	

  	if(keyAPressed == true)
  		ship.turn(-5);

  	if(keySPressed == true)
  		ship.accelerate(-.1);

  	if(keyDPressed == true)
  		ship.turn(5);

  	if(keyHPressed == true) { //hyperspace

  		ship.setX((int)(Math.random() * SCREEN_SIZE_X));
		ship.setY((int)(Math.random() * SCREEN_SIZE_Y));
		ship.setDirectionX(0);
		ship.setDirectionY(0);
		ship.setPointDirection((int)(Math.random() * 181));
		keyHPressed = false; // to make so that you only teleport once

  	}

}

//comprehensive function for asteroids -- basically do all the important stuff for asteroids
public void asteroidEssentials(ArrayList <Asteroid> asteroids, int radius, String description) {

	for(int i = 0; i < asteroids.size(); i++) {

		asteroids.get(i).move();
		asteroids.get(i).show();

		//remove asteroid if it hits ship
		if(asteroids.get(i).distFromFloater(playerShip) <= radius) {

			//split asteroid into 4 if it is big
			if(description.equals("big")) {

				for(int j = 0; j < 4; j++)
						smallRocks.add(new SmallAsteroid(rocks.get(i)));

			}

			asteroids.remove(i);
			i--;

		}

		//remove asteroid and bullet from if bullet hits asteroid
		for(int nI = 0; nI < bullets.size(); nI++) {

			if(asteroids.get(i).distFromFloater(bullets.get(nI)) <= radius) {

				//split asteroid into 4 if it is big
				if(description.equals("big")) {

					for(int j = 0; j < 4; j++)
						smallRocks.add(new SmallAsteroid(rocks.get(i)));

				}

				asteroids.remove(i);
				i--;
				bullets.remove(nI);
				nI--;
				break;

			}

		}

	}

}

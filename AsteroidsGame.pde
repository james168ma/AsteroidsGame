//public final static variables
public final static int SCREEN_SIZE_X = 1000;
public final static int SCREEN_SIZE_Y = 800;
public final static int BIG_A_RADIUS = 40;
public final static int SMALL_A_RADIUS = 20;
public final static int NUM_ASTEROIDS = 5;
public final static int NUM_STARS = (int)(Math.random()*300) + 300;
public final static int NUM_ENEMIES = 3;
public final static int MAX_NUM_PLAYER_BULLETS = 50;
public final static int MAX_NUM_ENEMY_BULLETS = 50;
public final static int MAX_BULLET_LIFE = 200;

//Key control variables
private boolean keyWPressed = false;
private boolean keyAPressed = false;
private boolean keySPressed = false;
private boolean keyDPressed = false;
private boolean keyHPressed = false;
private boolean spacePressed = false;

//Making new arrays and instances of objects
private Spaceship playerShip = new Spaceship(500, 400);
private ArrayList <EnemyShip> enemies = new ArrayList <EnemyShip>();
private ArrayList <Stars> starField = new ArrayList <Stars>();
private ArrayList <Asteroid> rocks = new ArrayList <Asteroid>();
private ArrayList <Asteroid> smallRocks = new ArrayList <Asteroid>();
private ArrayList <Bullet> bullets = new ArrayList <Bullet>();


public void setup() {

	//initiating size and background
	size(1000, 800);
	background(0);

	//making instances of stars, asteroids, and enemies
	for(int i = 0; i < NUM_STARS; i++) 
		starField.add(new Stars());

	for(int i = 0; i < NUM_ASTEROIDS; i++) 
		rocks.add(new Asteroid());

	for(int i = 0; i < NUM_ENEMIES; i++)
		enemies.add(new EnemyShip());

}


public void draw() {

	background(0);

	//show stars
	for(Stars star: starField)
		star.show();

	//do all the asteroid essentials (refer to function below if refresher needed)
	asteroidEssentials(rocks, BIG_A_RADIUS, "big");
	asteroidEssentials(smallRocks, SMALL_A_RADIUS, "small");

	//control, move, and show player's ship
  	controlPlayerShip(playerShip);
	playerShip.move();
  	playerShip.show();
  	playerShip.updateHealth(bullets, rocks, smallRocks);

  	//show and move enemy ships
  	for(EnemyShip enemy: enemies) {

  		enemy.move(playerShip);
  		enemy.show();
  		enemy.shoot(bullets);
  		enemy.updateHealth(bullets, rocks, smallRocks);

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

  	//add new player bullets
  	if((spacePressed == true) && (bullets.size() <= MAX_NUM_PLAYER_BULLETS)) 
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
//made separate for loops to prevent index out of bounds exception
public void asteroidEssentials(ArrayList <Asteroid> asteroids, int radius, String description) {

	for(Asteroid rock : asteroids) {

		rock.move();
		rock.show();

	}

	//remove asteroid if it hits player's ship
	for(int i = 0; i < asteroids.size(); i++) {

		if(asteroids.get(i).distFromFloater(playerShip) <= radius) {

			//split asteroid into 4 if it is big
			if(description.equals("big")) {

				for(int j = 0; j < 4; j++)
					smallRocks.add(new SmallAsteroid(rocks.get(i)));

			}

			asteroids.remove(i);
			break;

		}

	}

	//remove asteroid if it hits enemy ship
	for(int i = 0; i < asteroids.size(); i++) {

		for(int n = 0; n < enemies.size(); n++) {

			if(asteroids.get(i).distFromFloater(enemies.get(n)) <= radius) {

				//split asteroid into 4 if it is big
				if(description.equals("big")) {

					for(int j = 0; j < 4; j++)
						smallRocks.add(new SmallAsteroid(rocks.get(i)));

				}

				asteroids.remove(i);
				break;

			}

		}

	}

	//remove asteroid and bullet from if bullet hits asteroid
	for(int i = 0; i < asteroids.size(); i++) {

		for(int nI = 0; nI < bullets.size(); nI++) {

			if(asteroids.get(i).distFromFloater(bullets.get(nI)) <= radius) {

				//split asteroid into 4 if it is big
				if(description.equals("big")) {

					for(int j = 0; j < 4; j++)
						smallRocks.add(new SmallAsteroid(rocks.get(i)));

				}

				bullets.remove(nI);
				asteroids.remove(i);
				break;

			}

		}

	}

}
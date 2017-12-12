class EnemyShip extends Spaceship {

	protected int bulletTimer;

	public EnemyShip() {

		super(200, 200);

		jetColor = color(0, 0, 255);
		myColor = color(255, 0, 0);
		myCenterX = 1000;
		myCenterY = random(0, 800);
		bulletTimer = 20;
		COLLISION_RADIUS = 12;
		MAX_VELOCITY = 4;

	} 

	public void move (Spaceship pShip) {  //pShip is ship that the enemyShip targets

		//Point direction 
	    double deltaX, deltaY, angle;
	    deltaX = pShip.getX() - myCenterX;
	    deltaY = pShip.getY() - myCenterY;

	    angle = atan((float)(deltaY/deltaX)) * (180/Math.PI);

	    if(pShip.getX() < myCenterX) 
	      angle += 180;

	    myPointDirection = angle;  

	    accelerate(.05);
	    accelerating = true;

	    //calling Spaceship's move function
		super.move();

    } 

    public void shoot (ArrayList <Bullet> bullets) {

    	if((bulletTimer >= 20) && (bullets.size() <= MAX_NUM_ENEMY_BULLETS)) { 

  			bullets.add(new Bullet(this, 1, 0));
  			bulletTimer = 0;

  		}

  		bulletTimer++;

    }

}
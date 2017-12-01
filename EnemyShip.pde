class EnemyShip extends Spaceship {

	private int bulletTimer;

	public EnemyShip() {
		super(200, 200);

		corners = 8;
		int[] x = {12, 0, -6, -2, -12, -2, -6, 0};
		int[] y = {0, -9, -5, -3, 0, 3, 5, 9};
		xCorners = x;
		yCorners = y;

		jetCorners = 6;
		int[] jetX = {-12, -2, -6, -17, -6, -2};
		int[] jetY = {0, -3, -5, 0, 5, 3};
		xJetCorners = jetX;
		yJetCorners = jetY;
		jetColor = color(0, 0, 255);

		myColor = color(255, 0, 0);
		myCenterX = random(0, 1000);
		myCenterY = random(0, 800);
		myDirectionX = 0;
		myDirectionY = 0;
		myPointDirection = 0;
		accelerating = false;
		myHealth = 100;
		bulletTimer = 20;
		COLLISION_RADIUS = 6;
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

	    accelerate(.1);
	    accelerating = true;

	    //calling Spaceship's move function
		super.move();

    } 

    public void shoot (ArrayList <Bullet> bullets) {

    	if((bulletTimer >= 20) && (bullets.size() <= MAX_NUM_ENEMY_BULLETS)) { 

  			bullets.add(new Bullet(this));
  			bulletTimer = 0;

  		}

  		bulletTimer++;

    }

}
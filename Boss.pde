class Boss extends EnemyShip {

	public Boss() {

		super();

		corners = 8;
		int[] x = {12*3, 0, -6*3, -2*3, -12*3, -2*3, -6*3, 0};
		int[] y = {0, -9*3, -5*3, -3*3, 0, 3*3, 5*3, 9*3};
		xCorners = x;
		yCorners = y;

		jetCorners = 6;
		int[] jetX = {-12*3, -2*3, -6*3, -17*3, -6*3, -2*3};
		int[] jetY = {0, -3*3, -5*3, 0, 5*3, 3*3};
		xJetCorners = jetX;
		yJetCorners = jetY;

		myHealth = 1000;
		bulletTimer = 5;
		COLLISION_RADIUS = 12*3;
		MAX_VELOCITY = 2;

		myBar = new HealthBar(1, 250);

	}

	public void shoot (ArrayList <Bullet> bullets) {

    	if((bulletTimer >= 2) && (bullets.size() <= MAX_NUM_ENEMY_BULLETS)) { 

  			bullets.add(new Bullet(this, 3));
  			bulletTimer = 0;

  		}

  		bulletTimer++;

    }

}
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

		myHealth = 250;
		bulletTimer = 5;
		COLLISION_RADIUS = 12*3;
		MAX_VELOCITY = 2;

		myBar = new HealthBar(3, 60, 40);

	}

	public void show () {  //Draws the floater at the current position  
               
	    fill(myColor);   
	    stroke(myColor);    
	    
	    //translate the (x,y) center of the ship to the correct position
	    translate((float)myCenterX, (float)myCenterY);

	    //convert degrees to radians for rotate()     
	    float dRadians = (float)(myPointDirection * (Math.PI/180));
	    
	    //rotate so that the polygon will be drawn in the correct direction
	    rotate(dRadians);
	    
	    //draw the polygon
	    beginShape();
		    for (int nI = 0; nI < corners; nI++)
		      vertex(xCorners[nI], yCorners[nI]);
	    endShape(CLOSE);

	    //draw the rockets when accelerating
	    if(accelerating == true) {

	    	fill(jetColor);
	    	stroke(jetColor);

	    	beginShape();
		    	for (int i = 0; i < jetCorners; i++) 
		    		vertex(xJetCorners[i], yJetCorners[i]);
	    	endShape(CLOSE);

	    }

	    //"unrotate" and "untranslate" in reverse order
	    rotate(-1 * dRadians);
	    translate(-1 * (float)myCenterX, -1 * (float)myCenterY);

	    myBar.show(myHealth, 250);
    } 

	public void shoot (ArrayList <Bullet> bullets) {

    	if((bulletTimer >= 2) && (bullets.size() <= MAX_NUM_ENEMY_BULLETS)) { 

  			bullets.add(new Bullet(this, 3));
  			bulletTimer = 0;

  		}

  		bulletTimer++;

    }

    public void updateHealth(ArrayList <Bullet> bullets, ArrayList <Asteroid> rocks, ArrayList <Asteroid> smallRocks) {

    	super.updateHealth(bullets, rocks, smallRocks);

    	for(Bullet b : bullets) { //going through bullets ArrayList
    		if (distFromFloater(b) < COLLISION_RADIUS)
    			myHealth += .95;
    	}

    }



}
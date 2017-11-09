class Bullet extends Floater {

	public Bullet(Spaceship theShip) {

		corners = 4;
		int[] x = {1, -1, -1, 1};
		int[] y = {-1, -1, 1, 1};
		xCorners = x;
		yCorners = y;
		myColor = color(255);
		myCenterX = theShip.getX();
		myCenterY = theShip.getY();
		myPointDirection = theShip.getPointDirection();
		float dRadians = (float)(myPointDirection*(Math.PI/180));
		myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
		myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();
		
	}

	public void show () { //Draws the floater at the current position  
              
	    fill(myColor);   
	    stroke(myColor);    
	    
	    //translate the (x,y) center of the ship to the correct position
	    translate((float)myCenterX, (float)myCenterY);

	    ellipse(0, 0, 2, 2);
    } 
}
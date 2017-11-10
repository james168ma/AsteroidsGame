class Bullet extends Floater {

	private int bulletLife;

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
		bulletLife = 0;
		
	}

	public void setX(int x) { myCenterX = x; }
	public int getX() { return (int)myCenterX; }
	public void setY(int y) { myCenterY = y; }
	public int getY() { return (int)myCenterY; }
	public void setDirectionX(double x) { myDirectionX = x; }
	public double getDirectionX() { return myDirectionX; }
	public void setDirectionY(double y) { myDirectionY = y; }
	public double getDirectionY() { return myDirectionY; }
	public void setPointDirection(int degrees) { myPointDirection = degrees; }   
    public double getPointDirection() { return myPointDirection; } 
    public void setBulletLife(int life) { bulletLife = life; }
    public int getBulletLife() { return bulletLife; }

	public void show () { //Draws the floater at the current position  
              
	    fill(myColor);   
	    stroke(myColor);    
	    ellipse((float)myCenterX, (float)myCenterY, 2, 2);

    } 
}
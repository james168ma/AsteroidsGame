class Spaceship extends Floater {
	
	public Spaceship() {

		corners = 8;
		xCorners = new int[corners];
		yCorners = new int[corners];
		xCorners[0] = 12;
		yCorners[0] = 0;
		xCorners[1] = 0;
		yCorners[1] = -9;
		xCorners[2] = -6;
		yCorners[2] = -5;
		xCorners[3] = -2;
		yCorners[3] = -3;
		xCorners[4] = -12;
		yCorners[4] = 0;
		xCorners[5] = -2;
		yCorners[5] = 3;
		xCorners[6] = -6;
		yCorners[6] = 5;
		xCorners[7] = 0;
		yCorners[7] = 9;
		myColor = color(255);
		myCenterX = 0;
		myCenterY = 0;
		myDirectionX = 0;
		myDirectionY = 0;
		myPointDirection = 0;

	}   

	public void setX() { myCenterX = x; }
	public int getX() { return myCenterX; }
	public void setY() { myCenterY = y; }
	public int getY() { return myCenterY; }

}

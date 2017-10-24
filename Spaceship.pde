class Spaceship extends Floater {
	
	public Spaceship() {

		corners = 8;
		int[] x = {12, 0, -6, -2, -12, -2, -6, 0};
		int[] y = {0, -9, -5, -3, 0, 3, 5, 9};
		xCorners = x;
		yCorners = y;
		myColor = color(255);
		myCenterX = 200;
		myCenterY = 200;
		myDirectionX = 0;
		myDirectionY = 0;
		myPointDirection = 0;

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

    public void hyperSpace() {

    	myDirectionX = 0;
    	myDirectionY = 0;
    	myCenterX = (int)(Math.random() * 1000);
    	myCenterY = (int)(Math.random() * 1000);

    }

}

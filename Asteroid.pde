class Asteroid extends Floater {

	protected int rotateSpeed; //new variable for rotation of asteroids

	public Asteroid() {

		corners = 8;
		int[] x = {(int)(Math.random()*24)+12, (int)(Math.random()*16)+8, 0, -((int)(Math.random()*16)+8), -((int)(Math.random()*24)+12), -((int)(Math.random()*16)+8), 0, (int)(Math.random()*16)+8};
		int[] y = {0, -((int)(Math.random()*16)+8), -((int)(Math.random()*24)+12), -((int)(Math.random()*16)+8), 0, (int)(Math.random()*16)+8, ((int)(Math.random()*24)+12), (int)(Math.random()*16)+8};
		xCorners = x;
		yCorners = y;
		myColor = color(51, 25, 0);
		myCenterX = (int)(Math.random() * 1000);
		myCenterY = (int)(Math.random() * 800);
		myDirectionX = Math.random()*7-3;
		myDirectionY = Math.random()*7-3;
		myPointDirection = 0;
		rotateSpeed = (int)(Math.random()*7)-3; //set random rotateSpeed from -3 to 3

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
    public void setRotateSpeed(int speed) { rotateSpeed = speed; }
    public int getRotateSpeed() { return rotateSpeed; }

    public void move() {   //move the floater in the current direction of travel

		turn(rotateSpeed); //turn asteroid by the rotateSpeed
		super.move(); //calling the super.move function

	}

	//finds distance from any spaceship
	public float distFromFloater(Floater thing) { return dist((float)myCenterX, (float)myCenterY, (float)thing.getX(), (float)thing.getY()); }

}
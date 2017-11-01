class Asteroid extends Floater {

	private int rotateSpeed;

	public Asteroid() {

		corners = 8;
		int[] x = {12, 8, 0, -8, -12, -8, 0, 8};
		int[] y = {0, -8, -12, -8, 0, 8, 12, 8};
		xCorners = x;
		yCorners = y;
		myColor = color(51, 25, 0);
		myCenterX = (int)(Math.random() * 1000);
		myCenterY = (int)(Math.random() * 800);
		myDirectionX = Math.random()*7-3;
		myDirectionY = Math.random()*7-3;
		myPointDirection = 0;
		rotateSpeed = (int)(Math.random()*7)-3;

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
       
	    //change the x and y coordinates by myDirectionX and myDirectionY       
	    myCenterX += myDirectionX;    
	    myCenterY += myDirectionY; 

	   	//turn the Asteroid
	   	myPointDirection += rotateSpeed;

	    //wrap around screen    
	    if(myCenterX >width) {     
	      myCenterX = 0;    
	    }    
	    else if (myCenterX<0) {     
	      myCenterX = width;    
	    }    
	    if(myCenterY >height) {    
	      myCenterY = 0;    
	    } 
	    else if (myCenterY < 0) {     
	      myCenterY = height;    
	    }   

    }  

}
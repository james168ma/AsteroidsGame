class Spaceship extends Floater {

	//all new private variables are for making the jet rocket animation
	protected boolean accelerating;
	protected int jetCorners, jetColor, MAX_VELOCITY;
	protected int[] xJetCorners, yJetCorners;
	
	public Spaceship(int startX, int startY) {

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
		jetColor = color(255, 0, 0);

		myColor = color(255);
		myCenterX = startX;
		myCenterY = startY;
		myDirectionX = 0;
		myDirectionY = 0;
		myPointDirection = 0;
		accelerating = false;
		MAX_VELOCITY = 10;

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
    public void setAccelerating(boolean b) { accelerating = b; }
    public boolean getAccelerating() { return accelerating; }

    public void move () {

	    //Limit velocity
	    if(myDirectionX > MAX_VELOCITY) 
	    	myDirectionX = MAX_VELOCITY;
	    if(myDirectionX < -(MAX_VELOCITY)) 
	    	myDirectionX = -(MAX_VELOCITY);
	    if(myDirectionY > MAX_VELOCITY) 
	    	myDirectionY = MAX_VELOCITY;
	    if(myDirectionY < -(MAX_VELOCITY)) 
	    	myDirectionY = -(MAX_VELOCITY);
	    
	    //change the x and y coordinates by myDirectionX and myDirectionY       
	    myCenterX += myDirectionX;    
	    myCenterY += myDirectionY;     

	    //wrap around screen    
	    if(myCenterX >width)    
	    	myCenterX = 0;    
	    else if (myCenterX<0)   
	    	myCenterX = width;    

	    if(myCenterY >height)
	    	myCenterY = 0;   
	    else if (myCenterY < 0) 
	    	myCenterY = height; 

    } 

    public void show () {  //Draws the floater at the current position  
               
	    fill(myColor);   
	    stroke(myColor);    
	    
	    //translate the (x,y) center of the ship to the correct position
	    translate((float)myCenterX, (float)myCenterY);

	    //convert degrees to radians for rotate()     
	    float dRadians = (float)(myPointDirection*(Math.PI/180));
	    
	    //rotate so that the polygon will be drawn in the correct direction
	    rotate(dRadians);
	    
	    //draw the polygon
	    beginShape();
	    for (int nI = 0; nI < corners; nI++)
	    {
	      vertex(xCorners[nI], yCorners[nI]);
	    }
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
	    rotate(-1*dRadians);
	    translate(-1*(float)myCenterX, -1*(float)myCenterY);
    } 

}

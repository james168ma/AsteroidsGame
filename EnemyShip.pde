class EnemyShip extends Spaceship {

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
	    if(myCenterX > width)    
	    	myCenterX = 0;    
	    else if (myCenterX < 0)   
	    	myCenterX = width;    

	    if(myCenterY >height)
	    	myCenterY = 0;   
	    else if (myCenterY < 0) 
	    	myCenterY = height; 

    } 
}
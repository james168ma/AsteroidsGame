class SmallAsteroid extends Asteroid {

	public SmallAsteroid(Asteroid rock) {

		corners = 8;
		int[] x = {(int)(Math.random()*12)+6, (int)(Math.random()*8)+4, 0, -((int)(Math.random()*8)+4), -((int)(Math.random()*12)+6), -((int)(Math.random()*8)+4), 0, (int)(Math.random()*8)+4};
		int[] y = {0, -((int)(Math.random()*8)+4), -((int)(Math.random()*12)+6), -((int)(Math.random()*8)+4), 0, (int)(Math.random()*8)+4, ((int)(Math.random()*12)+6), (int)(Math.random()*8)+4};
		xCorners = x;
		yCorners = y;
		myColor = color(100, 100, 100);
		myCenterX = rock.getX();
		myCenterY = rock.getY();
		myDirectionX = Math.random()*7-3;
		myDirectionY = Math.random()*7-3;
		myPointDirection = 0;
		rotateSpeed = (int)(Math.random()*7)-3; //set random rotateSpeed from -3 to 3

	}  

}
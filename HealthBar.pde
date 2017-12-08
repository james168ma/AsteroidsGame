class HealthBar {

	private int myX, myY, mySize, myOffsetX, myOffsetY;
	private float myHealth;

	public HealthBar(int size, int offSetX, int offSetY) {

		myX = 0;
		myY = 0;
		mySize = size;
		myHealth = 100;
		myOffsetX = offSetX;
		myOffsetY = offSetY;

	}

	public void move(int x, int y) {

		myX = x - myOffsetX;
		myY = y + myOffsetY;

	}

	public void show(float health, int fullHealth) {

		noStroke();

		myHealth = health;

		fill(0, 255, 0);

		if((myHealth < fullHealth/2) && (myHealth >= fullHealth/4))
			fill(255, 255, 0);
		else if(myHealth < fullHealth/4)
			fill(255, 0, 0);

		rect(myX, myY, 50 * (float)((float)myHealth/(float)100), mySize * 2);

	}
}
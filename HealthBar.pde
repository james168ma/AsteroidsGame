class HealthBar {

	private int myX, myY, mySize, myHealth;

	public HealthBar(int size) {

		myX = 0;
		myY = 0;
		mySize = size;
		myHealth = 100;

	}

	public void move(int x, int y) {

		myX = x - 25;
		myY = y + 20;

	}

	public void show(int health) {

		noStroke();

		myHealth = health;

		// fill(0);
		// rect(myX, myY, mySize * 10, mySize * 2);

		fill(0, 255, 0);

		if((myHealth < 50) && (myHealth >= 25))
			fill(255, 255, 0);
		else if(myHealth < 25)
			fill(255, 0, 0);

		rect(myX, myY, (float)mySize * 50 * (float)((float)myHealth/(float)100), mySize * 2);

	}
}
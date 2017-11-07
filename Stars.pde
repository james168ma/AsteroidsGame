class Stars { //note that this class does NOT extend Floater

   	private int centerX, centerY, size;

	public Stars() {

		centerX = (int)(Math.random() * 1000);
		centerY = (int)(Math.random() * 800);
		size = (int)(Math.random() * 5) + 1;

	}

	//not sure if I will use these getters and setters
	public int getX() { return centerX; }
	public int getY() { return centerY; }
	public int getSize() { return size; }

	public void show() {

		fill(255);
		stroke(255);
		ellipse (centerX, centerY, size, size);

	}
}

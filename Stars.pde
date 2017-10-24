class Stars { //note that this class does NOT extend Floater

   	private int centerX, centerY, size;

	public Stars() {

		centerX = (int)(Math.random() * 1000);
		centerY = (int)(Math.random() * 1000);
		size = (int)(Math.random() * 5) + 1;

	}

	public int getX() { return centerX; }
	public int getY() { return centerY; }
	public int getSize() { return size; }

	public void show() {

		fill(255);
		ellipse (centerX, centerY, size, size);

	}
}

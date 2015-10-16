Particle[] molecule = new Particle[200];
void setup()
{
	frameRate(15);
	size (600,600);
	for (int i = 0; i < molecule.length - 2; i++)
	{
		molecule[i] = new NormalParticle();
	}
	molecule[198] = new OddballParticle();
	molecule[199] = new JumboParticle();
}
void draw()
{
	background(0);
	for (int i = 0; i < molecule.length; i++)
	{
		molecule[i].move();
		molecule[i].show();
	}
}
class NormalParticle implements Particle
{
	double x, y, speed, angle;
	NormalParticle() 
	{
		x = width/2;
		y = height/2;
		speed = Math.random()*10+5;
		angle = Math.random()*2*Math.PI;
	}
	public void move()
	{
		x = x + (speed*Math.cos(angle));
		y = y + (speed*Math.sin(angle));
		if (x > 600 || y > 600 || x < 0 || y < 0)
		{
			x = width/2;
			y = height/2;
		}
	}
	public void show()
	{
		noStroke();
		fill (255);
		int dotSize = (int)(Math.random()*5+10);
		ellipse ((float)x, (float)y, dotSize, dotSize);
	}

}
interface Particle
{
	public void show();
	public void move();
}
class OddballParticle implements Particle
{
	double x, y, speed, angle;
	OddballParticle() 
	{
		x = Math.random()*width;
		y = Math.random()*height;
		speed = Math.random()*10+5;
		angle = Math.random()*2*Math.PI;
	}
	public void move()
	{
		x += 5;
		if (x > 600 || y > 600 || x < 0 || y < 0)
		{
			x = width/2;
			y = height/2;
		}
	}
	public void show()
	{
		noStroke();
		int fillR = (int)(Math.random()*255);
		int fillG = (int)(Math.random()*255);
		int fillB = (int)(Math.random()*255);
		fill (fillR, fillG, fillB);
		int dotSize = 10;
		ellipse ((float)x, (float)y, dotSize, dotSize);
	}
}
class JumboParticle extends NormalParticle
{
	public void show()
	{
		noStroke();
		int fillR = (int)(Math.random()*255);
		int fillG = (int)(Math.random()*255);
		int fillB = (int)(Math.random()*255);
		fill (fillR, fillG, fillB);
		int dotSize = 50;
		ellipse ((float)x, (float)y, dotSize, dotSize);
	}
}

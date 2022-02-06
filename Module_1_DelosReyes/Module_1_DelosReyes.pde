float time = 0;
int globalVariable= 100;

// function that gets called at the very first frame
void setup()
{
  size(1280,720,P3D); // set window size to 1280 x 720
  camera(0,0, -(height / 2.0) / tan(PI * 30 / 180.0), 0, 0, 0, 0, -1, 0);
}

// function that gets called every frame
void draw()
{
  background(0); // sets the background color of the whole window 
  drawCartesianPlane();
  drawQuadraticFunction();
  drawLinearFunction();
  drawSineWave();
}

void drawCartesianPlane()
{
  color white = color(255, 255, 255);
  fill (white);
  stroke (white);
  
  line(-700, 0, 700, 0);
  line(0, -700, 0, 700);
  
  for(int i = -700; i <= 700; i += 10)
  {
    line(i, -5, i, 5);
    line(-5, i, 5, i);
  }
}

void drawQuadraticFunction()
{
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  for(float x = -200; x <= 200; x += 0.1f)
  {
    circle(x*2, ((x * x) - (15 * x) - 3), 5);
  } 
}

void drawLinearFunction()
{
  strokeWeight(1);
  color purple = color(128,0,128);
  fill(purple);
  stroke(purple);
  
  for(int x = -200; x <= 200 ; x++)
  {
    circle(x, ((-5 * x) + 30), 7);
  }
}

void drawSineWave()
{
  color blue = color(0, 0, 255);
  fill (blue);
  stroke (blue);
  
  for (float x = -200; x <= 200; x += 0.1f)
  {
    time += 0.01f;
    circle(x * 5, ((float)Math.sin(x + time)*20), 2);
  }
}

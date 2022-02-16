int frames = 0;
void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{
  drawPaint();

  if (frames == 300)
  {
    background(255);
    frames = 0;
  }
  frames ++;
}

float createGaussian(int standardDeviation, int mean)
{
  float gaussian = randomGaussian();
  return standardDeviation * gaussian + mean;
}

void drawPaint()
{
  float x = createGaussian(200, 20);
  float y = random(-360,361);
  float size = createGaussian(20, -3);
  float rRgb =random(256);
  float gRgb =random(256);
  float bRgb =random(256);
  float aRgb =random(10, 101);
  fill(rRgb, gRgb, bRgb, aRgb);
  circle(x,y,size);
}

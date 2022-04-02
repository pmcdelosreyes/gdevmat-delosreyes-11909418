Walker[] circle = new Walker[100];
int countFrame= 0;
void setup()
{
  size(1080,720,P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(80);
  for (int n=0; n<=99; n++)
  {
    circle[n] = new Walker();
  }
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth/2;
  float y = -(mouseY - Window.windowHeight/2);
  return new PVector (x,y);
}

void draw()
{
  PVector mouse = mousePos();
  PVector dis = new PVector();
  background(80);
  
  if(countFrame == 0)
  {
    for(int n = 0;n <= 99;n++)
    {
      circle[n].randomize();
    }
  }
  countFrame++;
 
  for(int n =0; n <= 99; n++)
  {
   circle[n].update();
   circle[n].render();
   dis = PVector.sub(mouse, circle[n].position);
   dis =dis.normalize();
   circle[n].acceleration.add(dis).mult(0.2);
   circle[n].checkWindow();
  }
} 

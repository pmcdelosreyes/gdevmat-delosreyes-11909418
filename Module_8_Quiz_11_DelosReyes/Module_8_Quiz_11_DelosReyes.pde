Walker[] circle = new Walker[10];
int countFrame= 0;

void setup()
{
  size(1280,720,P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(255);
  for(int n=0; n<=9; n++)
  {
    circle[n] = new Walker();
    circle[n].randomize();
    circle[n].scale = circle[n].mass * 10;
  }   
}

void draw()
{
  background(255);
  for(int n = 0; n <= 9; n++)
  {
    circle[n].update();
    circle[n].render();
    for(int t = 0; t <= 9; t++)
    {
      if(n  != t)
      {
        circle[n].applyForce(circle[t].calcAttract(circle[n]));
      }
    }
  }
}

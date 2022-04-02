Walker[] circle = new Walker[10];
int countFrame= 0;
PVector wind = new PVector(0.15,0);
PVector gravity = new PVector(0,-0.4);
float massValue = 1;

void setup()
{
  size(1080,720,P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(255);

//This For Loop is to intialize Everything
  for(int n = 0; n <= 9; n++)
  {
    circle[n] = new Walker();
    circle[n].mass = massValue;
    circle[n].scale = circle[n].mass * 15;
    circle[n].randomize();
    circle[n].position.x =-500;
    circle[n].position.y =200;
    massValue++;
  }
}

void draw()
{
  background(255);
  for(int n = 0; n <=  9; n++)
  {
    circle[n].render();
    circle[n].update();
    circle[n].applyForce(wind);
    circle[n].applyForce(gravity);
    circle[n].checkWindow();
  }
}

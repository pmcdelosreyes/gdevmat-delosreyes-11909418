Walker[] circle = new Walker[8];
int countFrame= 0;
PVector wind = new PVector(0.15,0);
PVector gravity = new PVector(0,-0.4);
int posY = 0;
float massValue = 1;
PVector accel = new PVector(0.2,0);

void setup()
{
  size(1280,720,P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(255);

  for(int n=0; n<=7; n++)
  {
    circle[n] = new Walker();
    posY= 2 * (Window.h / 8)  * (n - 4);
    circle[n].mass = massValue;
    circle[n].scale = circle[n].mass * 10;
    circle[n].randomize();
    circle[n].position =new PVector(-500,posY);
    massValue++;
  }
 massValue = 1;
}

void draw()
{
  background(255);
  
  //Middle Line
  strokeWeight(10);
  stroke(255,0,0);
  line(0,0, 0, 360);
  line(0,0, 0, -360);
  float mew;
  float normal = 1;
 
  if(mousePressed && (mouseButton == LEFT))
   {
    for(int n=0; n<=7; n++)
    {
      circle[n] = new Walker();
      posY= 2 * (Window.h / 8)  * (n - 4);
      circle[n].mass = massValue;
      circle[n].scale = circle[n].mass * 10;
      circle[n].randomize();
      circle[n].position =new PVector(-500,posY);
      massValue++;
    }
    massValue = 1;
   }
  
  for(Walker w : circle)
  {
    if(w.position.x >= 0)
    {
     mew = 0.4f;
    }
    else
    {
     mew = 0.01f; 
    }
    float frictMag = mew * normal;
    PVector frict = w.velocity.copy();
    frict.mult(-1);
    frict.normalize();
    frict.mult(frictMag);
    w.applyForce(frict);
    w.applyForce(accel);
    w.update();
    w.render();
    w.checkWindow();
  }
}

Walker[] circle = new Walker[10];
int countFrame= 0;
PVector wind = new PVector(0.1,0);
int posX = 0;
PVector accel = new PVector(0.2,0);
Liquid ocean = new Liquid(0,-100,Window.right,Window.bottom,0.1f);

void setup()
{
  size(1280,720,P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(255);
  
  for(int n=0; n<=9; n++)
  {
    circle[n] = new Walker();
    posX = 2 * (Window.w / 10)  * (n - 5);
    circle[n].randomize();
    circle[n].scale = circle[n].mass * 5;
    circle[n].position =new PVector(posX,200);
  }
}

void draw()
{
  background(255);
  ocean.render();
  
  for(Walker w : circle)
  {
    PVector gravity = new PVector(0, - 0.15f * w.mass);
    w.update();
    w.render();
    w.checkWindow();
    w.applyForce(gravity);
    w.applyForce(wind);
    float mew = 0.1f;
    float normal = 1;
    float fricMag = mew * normal;
    PVector frict = w.velocity.copy();
    w.applyForce(frict.mult(-1).normalize().mult(fricMag));
    
    if(ocean.isColliding(w))
    {
      PVector dragForce = ocean.calculateDrag(w);
      w.applyForce(dragForce);
    } 
  }
}

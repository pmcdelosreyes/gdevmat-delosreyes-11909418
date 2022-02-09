void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker walker = new Walker();
Walker walker2 = new Walker();

void draw()
{
  walker.randomWalk();
  walker.render();
  
  walker2.randomWalkBiased();
  walker2.render();
}

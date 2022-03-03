class Walker
{
  public PVector position = new PVector();
  public PVector speed = new PVector();
  public PVector colour = new PVector();
  public float size = 50;
  public float a;
  public float tX = 0, tY = 45;
 
  void render()
  {
    fill(colour.x, colour.y, colour.z, 255);
    noStroke();
    circle(position.x, position.y, size);  
  }
   
  void randomize()
  {
    colour.x = random(0, 256);
    colour.y = random(0, 256);
    colour.z = random(0, 256);
    size = random(50);
  }
}

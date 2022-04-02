class Walker
 {
  public PVector position = new PVector();
  public PVector acceleration = new PVector();
  public PVector velocity = new PVector();
  public PVector colour = new PVector();
  public float vectorLimit = 20;
  public float scale = 50;

void render()
 {
  fill(255, 255, 255, 255);
  noStroke();
  circle(position.x, position.y, scale);
 }
  
void update()
 {
  this.velocity.add(this.acceleration);
  this.velocity.limit(this.vectorLimit);
  this.position.add(this.velocity);
 }
  
//Randomize pos and scale
 void randomize()
 {
  this.position.x=random(Window.left,Window.right);
  this.position.y=random(Window.bottom,Window.top);
  scale = random(50);
 }
 
void checkWindow()
{
  if (this.position.x > Window.right)
  {
    this.position.x = Window.left;
  }
  else if (this.position.x < Window.left)
  {
    this.velocity.x = Window.right; 
  }
  if (this.position.y > Window.top)
  {
    this.position.y = Window.bottom;
  }
  else if (this.position.y < Window.bottom)
  {
    this.position.y = Window.top;
  }
 }
}

class Walker
{
 public PVector position = new PVector();
 public PVector acceleration = new PVector();
 public PVector velocity = new PVector();
 public PVector colour = new PVector();
 public float vectorLimit = 10;
 public float mass;
 public float scale;
 public float r;
 public float g;
 public float b;

void render()
{
  fill(r, g, b, 255);
  noStroke();
  circle(position.x, position.y, scale);
}
  
void update()
{
  this.velocity.add(this.acceleration);
  this.velocity.limit(this.vectorLimit);
  this.position.add(this.velocity);
  this.acceleration.mult(0);
}
  
void applyForce(PVector force)
{
  PVector f = PVector.div(force,this.mass);
  this.acceleration.add(f);
}

void randomize()
{
  this.r = random(0,256);
  this.g = random(0,256);
  this.b = random(0,256);
}
 
void checkWindow()
{
  if(this.position.x > Window.right)
  {
    this.position.x = Window.right;
    this.velocity.x *= -1;
  }
  else if (this.position.x < Window.left)
  {
    this.position.x = Window.left;
    this.velocity.x *= -1;
  }
  if (this.position.y > Window.top)
  {
    this.position.y = Window.top;
    this.velocity.y *= -1;
  }
  else if (this.position.y < Window.bottom)
  {
    this.position.y = Window.bottom;
    this.velocity.y *= -1; 
  }
 }
}

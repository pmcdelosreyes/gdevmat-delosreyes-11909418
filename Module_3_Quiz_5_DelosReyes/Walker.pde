class Walker
{
 PVector position = new PVector();
 PVector speed = new PVector(18,8);
 public float size = 50;
 PVector colour = new PVector();
 public float a;
 float tX = 0, tY = 100, tSize = 7, tR = 104, tG = 58,tB = 114, tA = 100;
 
void render()
{ 
  fill(colour.x, colour.y, colour.z, 100);
  noStroke();
  circle(position.x, position.y, size);
}
  
void perlinWalk()
{
  position.x = map(noise(tX), 0, 1, -540, 540);
  position.y = map(noise(tY), 0, 1, -360, 360);
  size = map(noise(tSize), 0, 1, 5, 150);
  colour.x = map(noise(tR), 0, 1, 0, 255);
  colour.y = map(noise(tG), 0, 1, 0, 255);
  colour.z = map(noise(tB), 0, 1, 0, 255);
  a= map(noise(tA), 0, 1, 5, 100);
  
  tX += 0.01f;
  tY += 0.01f;
  tSize += 0.01f;
  tR += 0.01f;
  tG += 0.01f;
  tB += 0.01f;
}
  
void randomWalk()
{
  int rng = int(random(7));
  if (rng == 0)
  { 
    position.y +=10;
  }
  else if (rng == 1)
  {
    position.y -= 10;
  }
  else if (rng == 2)
  {
    position.x -= 10;
  }
  else if (rng == 3)
  {
    position.x += 10;
  }
  else if (rng == 4)
  {
    position.x += 10;
    position.y += 10;
  }
  else if (rng == 5)
  {
    position.x -= 10;
    position.y += 10;
  }
  else if (rng == 6)
  {
    position.x -= 10;
    position.y -= 10;
  }
    else if (rng == 7)
  {
    position.x += 10;
    position.y -= 10;
  }
}
  
void randomWalkBiased()
{
  int rng = int(random(1, 101));
  if (rng <= 55)
  { 
    position.y-=10;
  }
  else if (rng <= 70 && rng >=56)
  {
    position. y+= 10;
  }
  else if (rng <= 85 && rng >=71)
  {
    position.x-= 10;
  }
    else if (rng <= 100 && rng >=86)
  {
    position.x+= 10;
  }
}
  
void moveAndBounce()
{
    background(255);
    position.add(speed);
    
    if (position.x > Window.right || position.x < Window.left)
    {
      speed.x *= -1;
      colour.x = random(1, 256);
      colour.y = random(1, 256);
      colour.z = random(1, 256);
    }
    if (position.y > Window.top || position.y < Window.bottom)
    {
      speed.y *= -1;
      colour.x = random(1, 256);
      colour.y = random(1, 256);
      colour.z = random(1, 256);
    }
  }
}

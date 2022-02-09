class Walker
{
  float x;
  float y;  
void render()
{
  int redRng = int(random(0, 255));
  int greenRng = int(random(0, 255));
  int blueRng = int(random(0, 255));
  int alphaRng = int(random(50, 100));
  fill(redRng, greenRng, blueRng, alphaRng); // Fill colors
  circle(x, y, 30); // Create circle
}
  
void randomWalk()
{
    int rng = int(random(7));
    if (rng == 0) //1
    { 
      y += 10;
    }
    else if (rng == 1) //2
    {
      y -= 10;
    }
    else if (rng == 2) //3
    {
      x -= 10;
    }
    else if (rng == 3) //4
    {
      x += 10;
    }
    else if (rng == 4) //5
    {
      x += 10;
      y += 10;
    }
    else if (rng == 5) //6
    {
      x -= 10;
      y += 10;
    }
    else if (rng == 6) //7 
    {
      x -= 10;
      y -= 10;
    }
    else if (rng == 7) //8
    {
      x  += 10;
      y  -= 10;
    }
}

void randomWalkBiased()
{
  int rng = int(random(0, 100));
    if (rng <= 50)
    { 
      y -= 10;
    }
    else if (rng <= 65 && rng >= 51)
    {
      y+= 10;
    }
    else if (rng <= 85 && rng >= 66)
    {
      x-= 10;
    }
    else if (rng <= 100 && rng >= 86)
    {
      x+= 10;
    }
  }
}

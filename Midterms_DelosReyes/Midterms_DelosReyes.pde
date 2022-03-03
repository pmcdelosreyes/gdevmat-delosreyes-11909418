int countFrame = 0;
Walker target = new Walker();
Walker[] matter = new Walker[200];
float timeX = 0, timeY = 45;

void setup()
{
  size(1080,720,P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  target.colour.x = 255;
  target.colour.y = 255;
  target.colour.z = 255;
  background(0);
  for(int n = 0; n <= 150; n++)
  {
    matter[n] = new Walker();
  }
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  
  return new PVector (x,y);
}

void draw()
{
  background(0);
  PVector loc = new PVector();
  
  //Control the Blackhole, Uncomment 32-35
  //PVector mouse = mousePos();
  //target.position.x = mouse.x;
  //target.position.y = mouse.y;
  
  //RNG every 180 frames / 3 seconds
  if (countFrame == 180 || countFrame == 0)
  {
     background(0);
     target.position.x = random(Window.left,Window.right+1);
     target.position.y = random(Window.bottom,Window.top+1);
      
     for (int n = 0; n <= 150; n++)
     {
       matter[n].randomize();
       // Gausian RNG 
       timeX = map(noise(timeX), 0, 1, Window.left, Window.right);
       timeY =  map(noise(timeY), 0, 1, Window.bottom, Window.top);
       timeX += 0.1f;
       timeY += 0.1f;
       matter[n].position.x=timeX;
       matter[n].position.y=timeY;
     }
    countFrame = 0;
  }
  countFrame++;
  
  // Move everything to Black Hole
  for (int n = 0; n <= 150; n++)
  {
     matter[n].render();
     loc = PVector.sub(target.position, matter[n].position);
     loc = loc.normalize().mult(5);
     matter[n].position.add(loc);
  }
  target.render();
}

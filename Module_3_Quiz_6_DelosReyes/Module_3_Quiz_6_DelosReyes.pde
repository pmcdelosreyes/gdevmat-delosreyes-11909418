void setup()
{
  size(1080,720,P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  
  return new PVector (x,y);
}

void draw()
{
  PVector mouse= mousePos();
  mouse.normalize().mult(350);
  background(130);
  
   // This is the glow of the lightsaber
  strokeWeight(10);
  stroke(255,0,0);
  line(0,0, mouse.x, mouse.y); 
  line(0,0, -mouse.x, -mouse.y);
  
  //This is the light of the lightsaber
  strokeWeight(5);
  stroke(255);
  line(0,0, mouse.x, mouse.y); 
  line(0,0, -mouse.x, -mouse.y);

  //This is the handle of the lightsaber
   mouse.normalize().mult(50);
  strokeWeight(13);
  stroke(0.0);
  line(0,0, mouse.x, mouse.y); 
  line(0,0, -mouse.x, -mouse.y);

}

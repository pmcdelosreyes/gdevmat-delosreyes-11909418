class Walker
{
   public float x;
   public float y;
   public float size;
   public float r;
   public float g;
   public float b;
   public float a;
   float tX = 0, tY = 100, tSize = 7, tR = 104, tG = 58,tB = 114, tA = 100;
 
   void render()
   {
    fill(r, g, b, 100);
    noStroke();
    circle(x, y, size);
   }
  
   void perlinWalk()
   {
    x = map(noise(tX), 0, 1, -540, 540);
    y = map(noise(tY), 0, 1, -360, 360);
    size = map(noise(tSize), 0, 1, 5, 150);
    r = map(noise(tR), 0, 1, 0, 255);
    g = map(noise(tG), 0, 1, 0, 255);
    b = map(noise(tB), 0, 1, 0, 255);
    a= map(noise(tA), 0, 1, 5, 100);
    
    tX += 0.01f;
    tY += 0.01f;
    tSize += 0.01f;
    tR += 0.01f;
    tG += 0.01f;
    tB += 0.01f;
   }
}

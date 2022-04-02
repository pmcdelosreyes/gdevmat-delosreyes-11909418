public class Liquid
{
 public float x, y, horizon, depth, cd;
 public Liquid(float x, float y, float horizon, float depth, float cd)
 {
   this.x = x;
   this.y = y;
   this.horizon = horizon;
   this.depth = depth;
   this.cd = cd;
 }

 public void render()
 {
   noStroke();
   fill(25,120,186);
   beginShape();
   vertex(x - horizon, y, 0);
   vertex(x + horizon, y, 0);
   vertex(x + horizon, y + depth, 0);
   vertex(x - horizon, y + depth, 0);
   endShape();
 }
  
 public boolean isColliding(Walker w)
 {
   PVector pos= w.position;
   return pos. x > this.x - this.horizon &&
          pos. x < this.x + this.horizon &&
          pos.y < this.y;
 }
  
 public PVector calculateDrag(Walker w)
 {
   float speed = w.velocity.mag();
   float dragMag = this.cd * speed * speed;
   PVector dragForce = w.velocity.copy().mult(-1);
   dragForce.normalize();
   dragForce.mult(dragMag);
   return dragForce;
 }
}

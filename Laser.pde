class Laser
{
  PVector posL;
  float speed;
  float angle;
  PShape square;
  
  Laser(PVector pv, float a)
  {
    posL = new PVector (pv.x, pv.y);
    speed = 10;
    angle = a;
  }
  
  void display()
  {
    float px = posL.x;
    float py = posL.y;
    noStroke();
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(px, py, 20, 20);
  }
  
  void update()
  {
      posL.x  = posL.x + cos(radians(angle - 90)) * speed;
      posL.y = posL.y + sin(radians(angle - 90)) * speed;
  }
  
}

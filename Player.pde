public class Player
{
  PVector pos;
  PImage sprite;
  float speed;
  float angle;
  Player (PImage sp)
  {
    pos = new PVector (width / 2, height / 2);
    sprite = sp;
    speed = 5;
    angle = 0;
  }
  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(radians(angle));
    imageMode(CENTER);
    image(sprite, 0, 0, 100, 100);
    popMatrix();
    
  }
  boolean isAlive()
  {
    return true;
  }
  
  void stop()
  {
    
  }
}

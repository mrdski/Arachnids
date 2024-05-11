class Spider
{
  float xPos, yPos;
  float speed;
  float angle;
  float size;
  PImage pic;
  
  Spider(float x, float y, float a, PImage p)
  {
    xPos = x;
    yPos = y;
    angle = a;
    size = 80;
    pic = p;
    speed = 3;
    
  }
  
  
  void drawSpider()
  {
    imageMode(CENTER);
    image(pic, xPos, yPos, size, size);
  }
  
  boolean collided(Laser las)
  {
    
    boolean above = las.posL.y + 10 < yPos - size/2;
    boolean below = las.posL.y - 10 > yPos + size/2;
    boolean left = las.posL.x + 10 < xPos - size/2;
    boolean right = las.posL.x -10 > xPos + size/2;
    return !(above || below || left || right);
  }
  
  boolean collidedPlayer(Player p)
  {
    boolean above = p.pos.y + 50 < yPos - size/2;
    boolean below = p.pos.y - 50 > yPos + size/2;
    boolean left = p.pos.x + 50 < xPos - size/2;
    boolean right = p.pos.x -50 > xPos + size/2;
    return !(above || below || left || right);
  }
  
  void update()
  {
    xPos  = xPos + cos(angle) * speed;
    yPos = yPos + sin(angle) * speed;
  }
}

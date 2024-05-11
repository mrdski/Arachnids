Player p;
Timer t;
PImage playerImage;
PImage spider;
boolean[] keys;
Laser l;
boolean pressed;
ArrayList<Laser> lasers;
ArrayList<Spider> spiders;
float xpos;
float ypos;
float lxpos;
float lypos;
int score;
String m;
void setup()
{
  size(1000, 1000);
  background(255);
  playerImage = loadImage("spaces.png");
  spider = loadImage("spider.png");
  p = new Player(playerImage);
  lasers = new ArrayList<Laser>();
  spiders = new ArrayList<Spider>();
  keys = new boolean[5];
  keys[0] = false; //UP
  keys[1] = false; //LEFT
  keys[2] = false; //RIGHT
  keys[3] = false; //SHIFT
  t = new Timer(1);
  t.start();
  m = "startS";
  score = 0;
}

void draw()
{
  if (m.equals("startS"))
  {
    background(0);
    textAlign(500, 500);
    textSize(30);
    text("Welcome to Spider Asteroids! \nPress the spacebar to start. You are the space ship. \nTry and kill as many spiders as you can! \nUse the spacebar to shoot and the arrows to move.", 150, 400);
    if (keys[3])
    {
      m = "play";
    }
  } else if (m.equals("play"))
  {
    background(245);
    textSize(30);
    text("Score: " + score, 25, 25);
    if (keys[0])
    {
      xpos = p.pos.x + cos(radians(p.angle - 90)) * p.speed;
      ypos = p.pos.y + sin(radians(p.angle - 90)) * p.speed;
      lxpos = p.pos.x + cos(radians(p.angle - 90)) * p.speed;
      lypos = p.pos.y + sin(radians(p.angle - 90)) * p.speed;
      p.pos.x = xpos;
      p.pos.y = ypos;
    }
    if (keys[1])
    {
      p.angle-= 4;
    }
    if (keys[2])
    {
      p.angle += 4;
    }
    if (keys[3]  && pressed == false)
    {
      this.shoot();
      pressed = true;
    }
    p.display();
    if (t.isFinished() ==true)
    {
      spiders.add(generateSpider());
      t = new Timer(1);
      t.start();
    }
    for (int i = 0; i < spiders.size(); i++)
    {
      spiders.get(i).update();
      spiders.get(i).drawSpider();
      if (spiders.get(i).collidedPlayer(p))
      {
        m = "end";
      }
    }
    for (int i = lasers.size()-1; i >= 0; i--)
    {
      lasers.get(i).update();
      lasers.get(i).display();
      boolean hit = false;
      for (int j = spiders.size()-1; j >= 0; j--)
      {
        if (spiders.get(j).collided(lasers.get(i)))
        {
          spiders.remove(j);
          hit = true;
          score++;
        }
      }
      if(hit)
      {
        lasers.remove(i);
      }
    }
  } else if (m.equals("end"))
  {
    background(0);
    textAlign(500, 500);
    textSize(30);
    text("You died and finished with " + score + " points", 150, 400);
  }
}
void keyPressed()
{
  if (key == CODED && keyCode == UP)
  {
    keys[0] = true;
  }
  if (key == CODED && keyCode == LEFT)
  {
    keys[1] = true;
  }
  if (key == CODED && keyCode == RIGHT)
  {
    keys[2] = true;
  }
  if (key == ' ')
  {
    keys[3] = true;
  }
}
void keyReleased()
{
  if (key == CODED && keyCode == UP)
  {
    keys[0] = false;
  }
  if (key == CODED && keyCode == LEFT)
  {
    keys[1] = false;
  }
  if (key == CODED && keyCode == RIGHT)
  {
    keys[2] = false;
  }
  if (key == ' ')
  {
    key = '{';
    keys[3] = false;
    pressed = false;
  }
}

void shoot()
{
  PVector newP = new PVector(lxpos, lypos);
  l = new Laser(newP, p.angle);
  lasers.add(l);
}

Spider generateSpider()
{
  int rNum = (int)random(1, 5);
  Spider sp = null;
  float yP = 0;
  float xP = 0;
  if (rNum == 1) //top
  {
    yP = -50;
    xP = random(0, width+1);
  }
  if (rNum == 2) //bottom
  {
    yP = 1050;
    xP = random(0, width+1);
  }
  if (rNum == 3) //left
  {
    yP = random(0, height+1);
    xP = -50;
  }
  if (rNum == 4) //right
  {
    yP = random(0, height+1);
    xP = 1050;
  }
  float ang = atan2(p.pos.y-yP, p.pos.x-xP);
  sp = new Spider(xP, yP, ang, spider);
  return sp;
}

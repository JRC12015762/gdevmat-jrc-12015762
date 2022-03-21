Walker balls[] = new Walker[10];
int ballCount = 10;

void setup ()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  makeBalls();
}

void draw ()
{  
  background(255);
  
  drawBalls();
}

void makeBalls ()
{
  for (int i = 0; i < ballCount; i++)
  {
    Walker ball = new Walker();
    ball.mass = int(random(10));
    ball.scale = ball.mass * 10;
    ball.position = new PVector(random(Window.left, Window.right), random(Window.bottom, Window.top));
    balls[i] = ball;
    println(i + " " + ball.position);
  }
}

void drawBalls ()
{
  
  for(int i = 0; i < ballCount; i++)
  {
    for(int j = 0; j < ballCount; j++)
    {
      balls[i].applyForce(balls[j].calculateAttraction(balls[i]));
    }
  }
  
  for (int i = 0; i < ballCount; i++)
  {   
    //PVector gravity = new PVector(0, -0.15 * balls[i].mass);
    balls[i].render();
    balls[i].update();
    
    if(!Float.isFinite(balls[i].position.x)) //no NaN values
    {
      makeBalls();
    }
  }
}

void checkBorders ()
{
  for (int i = 0; i < ballCount; i++)
  {
    if(balls[i].position.y <= Window.bottom)
    {
      balls[i].position.y = Window.bottom;
      balls[i].velocity.y *= -1;
    }
    if(balls[i].position.x >= Window.right)
    {
      balls[i].position.x = Window.right;
      balls[i].velocity.x *= -1;
    }
    if(balls[i].position.x <= Window.left)
    {
      balls[i].position.x = Window.left;
      balls[i].velocity.x *= -1;
    }
  }
}

void mouseClicked() 
{
  int value = 0;
  if (value == 0) 
  {
    makeBalls();
  }
}

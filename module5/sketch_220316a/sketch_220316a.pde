Walker balls[] = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector (0, -0.4);

void setup ()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  makeBalls();
}

void draw ()
{  
  background(80);
  
  drawBalls();
  checkBorders();
}

void makeBalls ()
{
  for (int i = 0; i < 10; i++)
  {
    Walker ball = new Walker();
    ball.mass = i+1;
    ball.scale = ball.mass * 15;
    ball.position = new PVector(-500, 200);
    balls[i] = ball;
  }
}

void drawBalls ()
{
  for (int i = 0; i < 10; i++)
  {
    balls[i].render();
    balls[i].update();
    balls[i].applyForce(wind);
    balls[i].applyForce(gravity);
  }
}

void checkBorders ()
{
  for (int i = 0; i < 10; i++)
  {
    if(balls[i].position.y <= Window.bottom)
    {
      balls[i].velocity.y *= -1;
    }
    if(balls[i].position.x <= Window.left || balls[i].position.x >= Window.right)
    {
      balls[i].velocity.x *= -1;
    }
  }
}

Walker balls[] = new Walker[10];
int ballCount = 8;

void setup ()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  makeBalls();
}

void draw ()
{  
  background(80);
  
  stroke(0);
  strokeWeight(5);
  line(0, 500, 0, -500);
  
  drawBalls();
  checkBorders();  
}

void makeBalls ()
{
  for (int i = 0; i < ballCount; i++)
  {
    Walker ball = new Walker();
    ball.mass = i+2;
    ball.scale = ball.mass * 15;
    ball.position = new PVector(Window.left + 5, (2 * (Window.top / ballCount)) * (i - (ballCount / 2)));
    balls[i] = ball;
  }
}

void drawBalls ()
{
  for (int i = 0; i < ballCount; i++)
  {
    float mew = 0.1f;
    if(balls[i].position.x > 0)
    {
      mew = 0.4f;
    }
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = balls[i].velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    
    PVector acceleration = new PVector(0.2 * balls[i].mass, 0);
        
    //PVector gravity = new PVector(0, -0.15 * balls[i].mass);
    balls[i].render();
    balls[i].update();
    
    balls[i].applyForce(acceleration);
    balls[i].applyForce(friction);
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

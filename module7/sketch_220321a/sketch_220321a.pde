Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

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
  
  ocean.render();
  drawBalls();
  checkBorders();
}

void makeBalls ()
{
  for (int i = 0; i < ballCount; i++)
  {
    Walker ball = new Walker();
    ball.mass = int(random(10));
    ball.scale = ball.mass * 10;
    ball.position = new PVector((2 * (Window.windowWidth / 10) * (i - 5)), Window.top - 10);
    balls[i] = ball;
  }
}

void drawBalls ()
{
  for (int i = 0; i < ballCount; i++)
  {
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = balls[i].velocity.copy();
    
    PVector wind = new PVector(0.1, 0);
    PVector gravity = new PVector(0, -0.15 * balls[i].mass);
        
    //PVector gravity = new PVector(0, -0.15 * balls[i].mass);
    balls[i].render();
    balls[i].update();
    
    balls[i].applyForce(wind);
    balls[i].applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
    balls[i].applyForce(gravity);
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
    if(ocean.isCollidingWith(balls[i]))
    {
      PVector dragForce = ocean.calculateDragForce(balls[i]);
      balls[i].applyForce(dragForce);
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

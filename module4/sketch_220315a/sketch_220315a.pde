Walker walkingDots[] = new Walker[100];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  makeDots();
}

void draw()
{
  background(80);
  
  updateDots();
}

void makeDots()
{
  for (int i = 0; i < 100; i++)
  {
    Walker dot = new Walker();
    dot.position = new PVector(random(Window.right), random(Window.top));
    dot.acceleration = new PVector(0.001, 0.001);
    dot.scale = random(10, 100);
    walkingDots[i] = dot;
  }
}

void updateDots()
{
  for (int i = 0; i < 100; i++)
  {
    walkingDots[i].update();
    walkingDots[i].render();
    walkingDots[i].checkEdges();
  }
}

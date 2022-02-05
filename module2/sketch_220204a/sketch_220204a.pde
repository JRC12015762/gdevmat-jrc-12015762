void setup ()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker wlkr = new Walker();
Walker bWlkr = new Walker();

void draw ()
{
  background(0);
  
  int r = int(random(256));
  int g = int(random(256));
  int b = int(random(256));
  int a = int(random(50, 101));
  
  wlkr.randomWalk();
  wlkr.render(r, g, b, a);
  bWlkr.randomWalkBiased();
  bWlkr.render(255, 0, 0, 100);
}

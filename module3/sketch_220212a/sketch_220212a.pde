void setup ()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker wlkr = new Walker();

void draw ()
{  
  background(255);

  wlkr.render();
  wlkr.moveAndBounce();
}

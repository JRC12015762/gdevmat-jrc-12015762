class Walker
{
  float x, y, tx = 0, ty = 1000;
  
  void render(float r, float g, float b, int a, float size)
  {    
    fill(r, g, b, a);
    noStroke();
    circle(x, y, size);
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0 , 1, -360, 360);
    
    tx += 0.01f;
    ty += 0.01f;
  }
  
}

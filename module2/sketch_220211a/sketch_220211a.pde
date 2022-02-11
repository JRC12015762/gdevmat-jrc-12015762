void setup ()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

Walker perlinWalker = new Walker();

float r, g, b, size, tR = 69, tG = 360, tB = 420, tSize = 1337;


void draw ()
{  
  size = map(noise(tSize), 0, 1, 5, 150);
  r = map(noise(tR), 0, 1, 0, 255);
  g = map(noise(tG), 0, 1, 0, 255);
  b = map(noise(tB), 0, 1, 0, 255);
  
  fill(0);
  noStroke();
  perlinWalker.perlinWalk();
  perlinWalker.render(r, g, b, 100, size);
  
  tSize += 0.01f;
  tR += 0.01f;
  tG += 0.01f;
  tB += 0.01f;
}

/*
float t = 0;
float n = noise(t);
float x = map(n, 0, 1, 0, 360);
rect(-640 + (t * 100), -360, 1, x);
t += 0.01;
*/

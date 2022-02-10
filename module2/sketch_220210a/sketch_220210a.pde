int frameCounter = 0;

void setup ()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);

}

void draw ()
{
  frameCounter++;
  
  float gaussian = randomGaussian();
  float gaussianCircleSize = randomGaussian();
  
  float standardDeviation = 500;
  float mean = 0;
  
  float sizeStandardDeviation = 20;
  float sizeMean = 20;
  
  float x = standardDeviation * gaussian + mean;
  float size = gaussianCircleSize * sizeStandardDeviation + sizeMean;
  
  
  int r = int(random(256));
  int g = int(random(256));
  int b = int(random(256));
  int a = int(random(10, 101));
  
  int y = int(random(-360, 361));
  
  noStroke();
  
  fill(r, g, b, a);
  circle(x, y, size);
  
  println(frameCounter);
  
  if(frameCounter == 300)
  {
    frameCounter = 0;
    background(0);
  }
  
}

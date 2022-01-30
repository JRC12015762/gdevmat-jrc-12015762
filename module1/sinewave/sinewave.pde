int xspacing = 2;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 100.0;  // Height of wave
float frequency = 100.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
float speed = 0.1;

//very first frame
void setup ()
{
  size(1280, 720, P3D); //set window size
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
  w = width+100;
  
  yvalues = new float[w/xspacing];
  println("q and a to change amp\nw and s to change freq\ne and d to change speed");
}

//every frame
void draw ()
{
  background(0);
  
  
 //circle(0, 0, 25);
 
 //strokeWeight(2); //thickness
 //color white = color(255, 255, 255);
 //fill(white); //fills with color
 //stroke(white); //strokes will be that color
 //line(-75, -75, 75, 75); //x1, y1, x2, y2
 
 dx = (TWO_PI / frequency) * xspacing;
 
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  calcWave();
  renderWave();
  
}

void keyPressed()
{
  switch( key )
  {
  case 'q':
    amplitude += 10;
    break;
  case 'a':
    amplitude -= 10;
    break;
  case 'w':
    frequency += 10;
    break;
  case 's':
    frequency -= 10;
    break;
    case 'e':
    speed += 0.01;
    break;
  case 'd':
    speed -= 0.01;
    break;


  default: 
    break;
  }
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += speed; //speed

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255, 0, 0);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    circle(x*xspacing - 700, yvalues[x], 10);
  }
}

void drawCircle()
{
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  float radius = 50;
  
  for (int x = 0; x <= 360; x++)
  {
    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
  }
}

void drawQuadraticFunction()
{
  //f(x) = x^2 + 2x - 5
  //f(x) = x^2 - 15x - 3
  
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
    circle(x * 10, (x * x) - (x * 15) - 3, 5);
  }
}

void drawLinearFunction()
{
  // f(x) = x + 2
  //f(x) = -5x + 30
  
  color purple = color(128, 0, 128);
  fill(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, (x * -5) + 30, 5);
  }
}

void drawCartesianPlane()
{
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(720, 0, -720, 0);
  line(0, 1280, 0, -1280);

  for(int i = -720; i <= 720; i+=10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

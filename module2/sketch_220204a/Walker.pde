class Walker
{
  float x, y;
  
  void render(int r, int g, int b, int a)
  {
    fill(r, g, b, a);
    noStroke();
    circle(x, y, 30);
  }
  
  void randomWalk()
  {
      int rng = int(random(8));
      
      switch(rng) 
      {
        case 0: //right
          x+=5;
          break;
        case 1: //left
          x-=5;
          break;
        case 2: //up
          y+=5;
          break;
        case 3: //down
          y-=5;
          break;
        case 4: //ur
          x+=5;
          y+=5;
          break;
        case 5: //dr
          x+=5;
          y-=5;
          break;
        case 6: //ul
          x-=5;
          y+=5;
          break;
        case 7: //dl
          x-=5;
          y-=5;
          break;
      }
      //println(rng);
  }
  
  void randomWalkBiased()
  {
    int rng = int(random(100)+1);
    
    if (rng <= 30) //right
    {
      x+=5;
    }
    else if (rng <= 40) //left
    {
      x-=5;
    }
    else if (rng <= 50) //up
    {
      y+=5;
    }
    else if (rng <= 60) //down
    {
      y-=5;
    }
    else if (rng <= 70) //ur
    {
      x+=5;
      y+=5;
    }
    else if (rng <= 80) //dr
    {
      x+=5;
      y-=5;
    }
    else if (rng <= 90) //ul
    {
      x-=5;
      y+=5;
    }
    else if (rng <= 100) //dl
    {
      x-=5;
      y-=5;
    }
  }
}

class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(5, 5);
  
  void render()
  {
    fill(255, 0, 0);
    noStroke();
    circle(position.x, position.y, 20);
  }
  
  void moveAndBounce()
  {
    position.add(speed);
    
    if ((position.x > Window.right) || (position.x < Window.left))
    {
      speed.x *= -1;
    }
    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      speed.y *= -1;
    }
  }
}

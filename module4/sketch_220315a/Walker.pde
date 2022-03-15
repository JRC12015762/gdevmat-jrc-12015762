class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  
  public Walker()
  {
    
  }
  
  public void update()
  {
    PVector direction = PVector.sub(mousePos(), this.position);
    this.acceleration.add(direction.normalize());
    this.velocity.add(this.acceleration.mult(0.2));
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  
  void render()
  {
    circle(position.x, position.y, scale);
  }
  
  PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector (x, y);
}
  
  public void checkEdges()
  {
    if(this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    else if(this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    if(this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if(this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
  
}

class Walker
{
  PVector position = new PVector();
  float scale = 15;
  
  void render()
  {
    fill(255, 0, 0);
    noStroke();
    circle(position.x, position.y, 20);
  }
  
}

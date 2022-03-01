class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(50, 50);
  
  final int r;
  final int g;
  final int b ;
  final int a;
  final float size;
  
  public Walker(int r, int g, int b, int a, float size)
  {
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
    this.size = size;
  }
  
  void render()
  {
    fill(r, g, b, a);
    noStroke();
    circle(position.x, position.y, size);
  }
  
  void renderBH (PVector mouse)
  {
    fill(255);
    this.position.x = mouse.x;
    this.position.y = mouse.y;
    circle(mouse.x, mouse.y, 50);
  }
}

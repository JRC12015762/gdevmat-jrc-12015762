class Walker
{
  public PVector position = new PVector(0, 0);
  public PVector velocity = new PVector(0, 0);
  public PVector acceleration = new PVector();
  
  public float velocityLimit = 10;
  public float scale = 15;
  public float mass = 1;
  
  public float gravitationalConstant = 1;
  
  int r = int(random(256)), g = int(random(256)), b = int(random(256));
  
  public Walker()
  {
    
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  void render()
  {
    noStroke();
    fill(r, g, b);
    circle(position.x, position.y, scale);
  }
  
  public PVector calculateAttraction(Walker wlkr)
  {
    PVector force = PVector.sub(this.position, wlkr.position);
    float distance = force.mag();
    force.normalize();
    
    distance = constrain(distance, 5, 25);
    
    float strength = (this.gravitationalConstant * this.mass * wlkr.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
}

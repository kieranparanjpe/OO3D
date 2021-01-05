public class Sphere extends Object
{
  private color colour;
  
  public Sphere(color c)
  {
     super();
    colour = c;
  }
  
  public Sphere(color c, Transform t)
  {
    super(t);
    colour = c;
  }
  
  @Override
  public void Draw()
  {
    pushMatrix();
  
    translate(transform.position.x, transform.position.y, transform.position.z);
    rotateX(transform.rotation.x);
    rotateY(transform.rotation.y);
    rotateZ(transform.rotation.z);
    
    stroke(8);
    fill(colour);
  
    sphere(transform.scale.x / 2);
    
    popMatrix();
  }
  
}

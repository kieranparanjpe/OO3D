private ArrayList<Object> objects = new ArrayList<Object>();

PImage diamond;
PImage grassTop;
PImage grassBottom;
PImage grassSide;

private PVector forward = new PVector(0, 0, 1);
float rotX;

float deltaX;

boolean x;

public void setup()
{
  size(600, 600, P3D);
    
  diamond = loadImage("diamond.png");
  grassTop = loadImage("grass_top.png");
  grassBottom = loadImage("dirt.png");
  grassSide = loadImage("grass_side.png");

  objects.add(new Cube(color(0, 150, 150), new Transform(new PVector(300, 300, 0))));
  objects.add(new Sphere(color(0, 150, 150), new Transform(new PVector(100, 100, 0))));
  objects.add(new TexturedCube(diamond, new Transform(new PVector(400, 200, 0))));
  objects.add(new TexturedCube(new PImage[] {grassSide, grassSide, grassSide, grassSide, grassTop, grassBottom}, new Transform(new PVector(400, 400, 0))));

  
  textureMode(NORMAL);
  
  forward.x = 1;
  forward.z = 1;
}

public void draw()
{
  background(255);
  
  deltaX -= 5;
  
  
  if(x)
  {
    if(forward.x < width && forward.x > 0)
    {
      forward.x += deltaX;
    }
    if(forward.x >= width || forward.x <= 0)
    {
      x = !x;
    }
  }
  
  if(!x)
  {
    if(forward.z < width && forward.z > 0)
    {
      forward.z += deltaX;
    }
    if(forward.z > width || forward.z < 0)
    {
      x = !x;
    }
  }

  
  //rotX+= 10;
  
  //forward.rotate(rotX);
  
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), forward.x, height / 2, forward.z, 0, 1, 0);
  
  for(Object o : objects)
  {
     o.Draw(); 
  }
}

public void mouseDragged()
{
  for(Object o : objects)
  {
     
     o.transform.rotation.x += (pmouseY - mouseY) * 0.01;
     o.transform.rotation.y -= (pmouseX - mouseX) * 0.01;
  } 
}

public class Transform
{
   public PVector position = new PVector();
   public PVector rotation = new PVector();
   public PVector scale = new PVector(100, 100, 100);
   
   public Transform(PVector pos, PVector rot, PVector scl)
   {
     position = pos;
     rotation = rot;
     scale = scl;
   }
   
   public Transform(PVector pos)
   {
     position = pos;
   }
}

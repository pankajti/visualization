 public class Planet  {
  PVector pos;
  float radius;
  float distance; 
  float angel =0;
  float orbitSpeed=.0;
   String name;
   int numMoons;
   PImage img ;
    PShape planet;
   Planet[] moons = new Planet[numMoons];
  
  Planet (float radius , float distance, String name, PImage pimg ){
    this.radius=radius;
     this.distance=distance;
     this.name = name;
     this.img = pimg;
  }
  
  public void setOrbitSpeed(float orbitSpeed){
          this.orbitSpeed = map(orbitSpeed, 1/520,10, 0, TWO_PI);
  }
  
  public void show(float origin, float closenessFactor, float distance_scale  , float radius_scale , float text_scale, float scale_small_planets) {
    String intro =  showSmall ? "Closer to The Sun" : " Away From The Sun";
    intro = "Space Traveller \n" +intro;
    text(intro, cameraposX-300, height/2-400, cameraposZ-800);
    text("Click on Screen to change The View ", cameraposX-400, height/2-300, cameraposZ-800);
    pushMatrix();
    float rotation_speed_scale= 30;
    float r = map(radius,  1400, 1428000, 0, 12*radius_scale);
    float d = map(distance,  0, 67, 0,96*distance_scale);
     if (!this.name.equals("Sun")){
      r = r*scale_small_planets;
    }
    angel= angel+orbitSpeed;
    beginShape();
     noStroke();
     r=  r*closenessFactor;
     planet = createShape(SPHERE,r);
     planet.setTexture(this.img);
      endShape();     
      fill(255);
      rotate(angel/rotation_speed_scale);
      translate((origin+d)  , height/2, 0);
      shape(planet);
    for (Planet p : moons){
      rotate(radians(angel));
      p.show(origin,  closeness_factor, distance_scale, radius_scale, text_scale, scale_small_planets);
      rotate(-radians(angel));
    }
        textSize(15*text_scale);
        text(name, 0, r+100, 0);
              popMatrix();
  }
}

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SolarSystemTraveller extends PApplet {

  ArrayList<Planet> planets = new ArrayList<Planet>();
 
  float distance_from_origin =-30.0f;
  float cameraposX =0;
  float cameraposY =0;
  float cameraposZ =0;
  float cameraPosXSpeed = 0;
  float cameraPosYSpeed = 0;
  float closeness_factor=1;
  float cameraposZSpeed = 3;
  boolean showSmall = true;
 SolarSystemDataReader dataReader = new SolarSystemDataReader();
    public void settings(){
      size(1600,1000,P3D);
    }
    public void setup() {
      cameraposY= height/2;
      cameraposZ= 800;
       cameraposX=0;
      dataReader.readSolarSystemData();
      }
      
    public void draw(){     
     distance_from_origin = distance_from_origin+move_speed;
        background(0,60,65);
              text("Click on Screen to change ", cameraposX, cameraposY);

        if (showSmall){
          show_small_planets();
        }
        else{
          show_distant_planets();
        }
        
     }
     public void show_small_planets(){
      float distance_scale = 1000;
      float radius_scale= 50;
      float text_scale = 3;
      float scale_small_planets = 100;
      distance_from_origin = distance_from_origin+move_speed;
        background(0,60,65);
        cameraposX = cameraposX+cameraPosXSpeed;
        cameraposY= cameraposY+cameraPosYSpeed;
        cameraposZ= cameraposZ + cameraposZSpeed;
        lights();
        camera(cameraposX, cameraposY, cameraposZ, cameraposX, cameraposY, 0, 0.0f, 1.0f, 0);
         for(Planet p : planets){
           p.show(0, closeness_factor, distance_scale, radius_scale, text_scale, scale_small_planets);
     }
     }
     
     public void show_distant_planets(){
      float distance_scale = 100;
      float radius_scale= 50;
      float text_scale = 3;
      float scale_small_planets = 1;
      distance_from_origin = distance_from_origin+move_speed;
        background(0,60,65);
        cameraposX = cameraposX+cameraPosXSpeed;
        cameraposY= cameraposY+cameraPosYSpeed;
        cameraposZ= cameraposZ + cameraposZSpeed;
        lights();
        camera(cameraposX, cameraposY, cameraposZ, cameraposX, cameraposY, 0, 0.0f, 1.0f, 0);
         for(Planet p : planets){
           p.show(0, closeness_factor, distance_scale, radius_scale, text_scale, scale_small_planets);
     }
     }
     
     
     public void mouseClicked(){
   showSmall = !showSmall;
   
    
    
}
 public class Planet  {
  PVector pos;
  float radius;
  float distance; 
  float angel =0;
  float orbitSpeed=.0f;
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
class PlanetViewParams{
  
  float origin =0;
      float closeness_factor = distance_from_origin;
      float distance_scale = 20000;
      float radius_scale= 100;
      float text_scale = 10;
      float scale_small_planets = 100;
}
  int numPlanets= 20;
  float move_speed= 0.0f;
 Planet murcury;
  Planet venus;
    Planet sun;

public void prepareRandomSolarSystem(){
      sun = new Planet(100,20, "sun", null);
      float radius=100;
      float distance = 20;
      for (int i =0;i<numPlanets; i++){
        distance = distance+ random(100,200)+radius;
        radius= random(0,100);
        Planet p  = new Planet(radius, distance,"Planet "+i, null);
        int numMoons = PApplet.parseInt(random(5));
        if (numMoons>0 && i>0){
        Planet[] moons = new Planet[numMoons];
        for (int j =0; j < numMoons; j++){
          Planet moon = new Planet(random(0, radius), random(planets.get(i-1).distance, distance), 
          "Planet "+ i + "Moon"+ j , null);
          moon.angel = j*360/numMoons;
          moons[j]= moon;
        }
        p.moons = moons;
        }
        planets.add(p);
      }
      murcury = new Planet(20, 100+100+20, "mercury", null);
      venus = new Planet(120, 100+100+240, "venus", null);
    }
    
    public void drawRandomSolarSystem(){
      float closenessFactor=1;
      distance_from_origin = distance_from_origin+move_speed;
        background(123);
        cameraposX = cameraposX+cameraPosXSpeed;
        camera(cameraposX, height/2, 800, cameraposX, height/2, 30, 0.0f, 1.0f, 0);
        text(mouseX, 0,0);
        text(mouseY, 0 ,20);
        //println(mouseX, mouseY);
        sun.show( 0, closenessFactor, 1,1,1,1); 
         for(Planet p : planets){
           p.show(0, closenessFactor, 1,1,1,1);
         }
    }

class SolarSystemDataReader{
public void readSolarSystemData(){
  Table solarSystemTable = loadTable("solar_system.csv", "header");
  for (TableRow tr : solarSystemTable.rows()){
    String name = tr.getString("Name");
    
    float distance= tr.getFloat("Mean Distance from Sun (AU)");
    float radius = tr.getFloat("Diameter (km)")/2;
    PImage img = loadImage(tr.getString("Image"));
    Planet p = new Planet(radius, distance, name,img);
    float orbitSpeed = 1/tr.getFloat("Orbital Period (years)");
    p.setOrbitSpeed(orbitSpeed);
    p.img=img;
    if (name.equals("Sun")){
      p.orbitSpeed=0;
            //continue;
    }
    planets.add(p);
  }
}
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SolarSystemTraveller" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

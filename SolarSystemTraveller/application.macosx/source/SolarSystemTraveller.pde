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
        camera(cameraposX, cameraposY, cameraposZ, cameraposX, cameraposY, 0, 0.0, 1.0, 0);
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
        camera(cameraposX, cameraposY, cameraposZ, cameraposX, cameraposY, 0, 0.0, 1.0, 0);
         for(Planet p : planets){
           p.show(0, closeness_factor, distance_scale, radius_scale, text_scale, scale_small_planets);
     }
     }
     
     
     void mouseClicked(){
   showSmall = !showSmall;
   
    
    
}

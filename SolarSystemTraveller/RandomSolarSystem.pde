  int numPlanets= 20;
  float move_speed= 0.0;
 Planet murcury;
  Planet venus;
    Planet sun;

void prepareRandomSolarSystem(){
      sun = new Planet(100,20, "sun", null);
      float radius=100;
      float distance = 20;
      for (int i =0;i<numPlanets; i++){
        distance = distance+ random(100,200)+radius;
        radius= random(0,100);
        Planet p  = new Planet(radius, distance,"Planet "+i, null);
        int numMoons = int(random(5));
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
    
    void drawRandomSolarSystem(){
      float closenessFactor=1;
      distance_from_origin = distance_from_origin+move_speed;
        background(123);
        cameraposX = cameraposX+cameraPosXSpeed;
        camera(cameraposX, height/2, 800, cameraposX, height/2, 30, 0.0, 1.0, 0);
        text(mouseX, 0,0);
        text(mouseY, 0 ,20);
        //println(mouseX, mouseY);
        sun.show( 0, closenessFactor, 1,1,1,1); 
         for(Planet p : planets){
           p.show(0, closenessFactor, 1,1,1,1);
         }
    }

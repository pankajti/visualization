 function Person (position, speed, acc, col){
  
  this.position = position;
  this.speed= speed;
  this.acc= acc;
  this.lifeSpan = 5000;
  this.infectionTime= 0;
  this.mass= 10;
  this.radius= 5;
  this.type=0;
   this.fillColor = col;
   
 this.update = function(){
    this.speed.add(this.acc);
    this.position.add(this.speed);
    this.lifeSpan=this.lifeSpan-1;
  };
  
  this.checkCollision = function(other){
    d= dist(this.position.x, this.position.y, other.position.x, other.position.y);
       // print(d);
    if (d <other.radius+ this.radius){
      if(this.type != other.type){
        infectious = this.type==2? this : other;
        unInfectious = this.type==1? this : other;
               t_red = red(infectious.fillColor);
               t_green = green(infectious.fillColor);
                 o_red = red(unInfectious.fillColor);
                 o_green = green(unInfectious.fillColor);
                 unInfectious.fillColor= color(t_red,0,0);
                 unInfectious.type = infectious.type;    
                 cs.addPatient(unInfectious);
                 //cs.addPatient(infectious);
                 return 1;
      }
       
    }
    return 0;
  };
  
  this.repel = function(other){
    tmp  = this.lifeSpan;
    this.lifeSpan = tmp- other.lifeSpan;
    other.lifeSpan = other.lifeSpan - tmp;
     this.speed.x= -this.speed.x;
          other.speed.x= -other.speed.x;
           this.speed.y= -this.speed.y;
          other.speed.y= -other.speed.y;
  };
  
   this.attract = function(other){
     this.radius = this.radius+other.radius;
     other.lifeSpan =0;
  };
  
  this.applyForce = function(force){
    this.acc= force/this.mass;
  };
  
  this.show = function(){
    noStroke();
      fill(this.fillColor, map(this.lifeSpan , 0, this.lifeSpan , 0, 255));
      ellipse(this.position.x, this.position.y,this.radius,this.radius);
  };
  
  this.checkObstacle = function(){
    if (this.position.x > width-25 || this.position.x<100){
            this.speed.x= -this.speed.x;
    }
     if (this.position.y > height-25 || this.position.y<200){
      this.speed.y= -this.speed.y;
    } 
  };
  
  this.isDead = function(){
    if(this.lifeSpan<=0){
      return true;
    }
  };   
 }
 

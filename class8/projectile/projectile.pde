
float radius = 5;
float gravity =-1.0;
float ySpeed = 2;
float xSpeed = 2;

float x=20,y=600;
void settings(){
  size(800, 600);
}

void setup(){
}

void draw(){
  x= x+xSpeed;
  y =   y-ySpeed  ;
  ySpeed =   ySpeed+gravity;
  ellipse(x, y, radius, radius);
  println(y);
}

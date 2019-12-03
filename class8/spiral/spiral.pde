
int r = 100;
int cx;
int cy;
float x=0, y=0;
float a = 0.05;
void setup() {
    size(400, 400);
    cx = width / 2;
    cy = height / 2;
}
 
void draw() {
  //background(123);
    for (int i = 0; i < 10000; i++) {
      fill(255, random(244), random(233));
        float t = radians(i);
        x = cx + a * t * r * cos(t);
        y = cy + a * t * r * sin(t);
        ellipse(x, y, 10,10);
    }
}

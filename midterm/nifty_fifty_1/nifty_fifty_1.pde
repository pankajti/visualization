  //<>//
float w =0 ;
float h = 0;
float x=100;
float margin = 10;
Controller controller = new Controller();
String [] visNames = {"Industry Count" , "Industry Composition" , "Ticker Duration"};
color[] rect_fill_color = new int[visNames.length];
int vis_index = 0;
PImage logo ;
void settings(){
    size(800,800);
}

void setup(){
    float ht = height-200;
  w = (width) -  margin;   //<>//
  h = (ht/visNames.length) -  2*margin; //<>//
   controller.init();
   logo = loadImage("nifty.png");
}

void draw(){ 
  draw_vis();
}

void draw_vis(){
  fill(255);
  background(122,0,133);
  textSize(16);
  text("Welcome to nifty50 Viz Portal", 30 ,40);
  fill(0);
     image(logo, 0 ,100);

  float ht = height-200;
  for (int i =0;i < visNames.length;i++){
    rect_fill_color[i] = color(0,98,255);
    float y=i*ht/visNames.length + margin+100;
    if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
        rect_fill_color[i] = color(250,123,0);
        vis_index=i;
  }
  
  fill(rect_fill_color[i]);  
    rect(x, y, w,h);
    fill(0);
    textSize(20);
    text(visNames[i], (margin+w/2)-3*(visNames[i].length()), i*(ht/visNames.length )+h/2+120);
    textSize(14);

  } 
}

void mouseClicked(){
  println(visNames[vis_index]);
  if (mouseX > x && mouseY > 100 && mouseY< height-100){
    if (  mouseY> ((vis_index+1)*height)/visNames.length  ){
      return;
    }
  controller.showSketch(vis_index);
  }
}

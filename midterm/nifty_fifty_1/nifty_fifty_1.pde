  //<>//
float w =0 ;
float h = 0;
float x=100;
float margin = 2;
Controller controller = new Controller();
String [] visNames = {"Industry Count" , "Industry Composition" , "Ticker Duration"};
color[] rect_fill_color = new int[visNames.length];
int vis_index = 0;

void settings(){
    size(800,800);
}

void setup(){
  w = (width) -  margin;   //<>//
  h = (height/visNames.length) -  2*margin; //<>//
   controller.init();
}

void draw(){ 
  draw_vis();
}

void draw_vis(){
  for (int i =0;i < visNames.length;i++){
    rect_fill_color[i] = color(0,98,255);
    float y=i*height/visNames.length + margin;
    if (mouseX >= x && mouseX <= x+w && 
      mouseY >= y && mouseY <= y+h) {
        rect_fill_color[i] = color(250,123,0);
        vis_index=i;
  }
  
  fill(rect_fill_color[i]);  
    rect(x, y, w,h);
    fill(0);
    textSize(20);
    text(visNames[i], (margin+w/2)-3*(visNames[i].length()), i*(height/visNames.length )+h/2+20);
    textSize(14);

  } 
}

void mouseClicked(){
  println(visNames[vis_index]);
  if (mouseX > x){
    if (  mouseY> ((vis_index+1)*height)/visNames.length  ){
      return;
    }
  controller.showSketch(vis_index);
  }
}

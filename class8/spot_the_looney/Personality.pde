abstract class Personality{
  PImage img;
  String name;
  String type;
  float x_pos, y_pos;
  public Personality(){
  }
  public Personality(String name , String type , PImage img){
    this.name = name;
    this.type = type;
    this.img = img;
  }
  
  abstract void perform();
  
  public void drawImage(){
     x_pos=random(0, width- img.width);
    y_pos=random(0, height- img.height);
    image(img, x_pos, y_pos);
    text(name,       x_pos, y_pos+img.height+5);

    
  }
}

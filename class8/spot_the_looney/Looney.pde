class Looney extends Personality{
  
  public Looney(String name, PImage img){
    super(name , "Looney", img);
    x=random(0, width- img.width);
    y=random(0, height- img.height);
  }
  public void perform(){
    println("I am a looney");
  }
  public void drawImage(){
    image(img,x, y);
  }
}

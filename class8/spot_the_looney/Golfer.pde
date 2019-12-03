class Golfer extends Personality{
  
  public Golfer(String name, PImage img){
    super(name , "Player", img);
  }
  public void perform(){
    println("I hit the ball");
  }
  
}

class Actor extends Personality{
  
  public Actor(String name, PImage img){
    super(name , "Actor", img);
  }
  public void perform(){
    println("I act ");
  }
  
}

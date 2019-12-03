class Politician extends Personality{
  
  public Politician(String name, PImage img){
    super(name , "Politician", img);
  }
  public void perform(){
    println("I do politics");
  }
  
}

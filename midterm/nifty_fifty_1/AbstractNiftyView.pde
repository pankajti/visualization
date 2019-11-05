abstract class AbstractNiftyView extends PApplet {
  
   boolean visible = false;
  
  public boolean isVisible(){
    return visible;
  }
  
  public void  setVisible( boolean visible){
     this.visible = visible;
  }
}

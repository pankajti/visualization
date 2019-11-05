


class Controller{
  
 IndustryCountView icView = new IndustryCountView();
 IndustryCompositionView icView1 = new IndustryCompositionView();
 TickerCompositionView icView2 = new TickerCompositionView();
  HashMap<Integer, AbstractNiftyView> viewsMap = new HashMap<Integer, AbstractNiftyView>();

  public Controller(){
     viewsMap.put(0,icView);
     viewsMap.put(1,icView1);
     viewsMap.put(2,icView2);     
  }
  
  public void init(){
    DataLoader loader = new DataLoader();
    Table niftyTable = loader.loadNiftyData();
    IndustryAnalysis ia = new IndustryAnalysis();
    TickerAnalysis ta = new TickerAnalysis();
    
      ia.calculateIndustryCompositions(niftyTable);
       ia.calculateIndustryContribution(niftyTable);
       ta.calculateTickerDuration(niftyTable);
       //PApplet.runSketch(new String[]{"My view 1"}, icView);
  }
  
  void showSketch(int num){
    AbstractNiftyView view = viewsMap.get(num);
    
    if(!view.isVisible()){
          view.setVisible(true);
 
    PApplet.runSketch(new String[]{"view"}, view);
  }
}
}

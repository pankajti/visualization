class IndustryCompositionView extends AbstractNiftyView{
  float indIndex=0;
  float hMargin =20;
  int yearIndx=0;
  int industryIdx = 0;
  float wMargin = 20;
  SortedSet<String> allIndustries = new TreeSet();
  ArrayList <String> allIndList;
  // Integer [] years= yearIndustryContributionMap.keySet().toArray(new Integer[yearIndustryContributionMap.size()]);
  Integer [] years = {2009,2010, 2011,2012,2013, 2014, 2015, 2016,2017,2018,2019};
 void  settings(){
   size(1000,800);
  }
  
  void setup(){
    for (int year : years){
      allIndustries.addAll(yearIndustryContributionMap.get(year).keySet());
    }
    allIndList= new ArrayList<String>(allIndustries);
    //frameRate(.5);
  }
  
   void draw(){
     background(0,122,199);
     int year = years[yearIndx];
     yearIndx= (yearIndx+1)%(years.length-1);
     //drawYearWiseAnimate();
     drawHeatMap();
     }
     
     float hBorder=100;
      float wBorder=20;
      
      
     void drawHeatMap(){
       text("Heatmap for Industry compositions Across Years", (width/2)-100, hBorder/2 );
       float indLocation= 50;
       float wMargin= (width - indLocation - wBorder)/allIndList.size()  ;
         float indYLoc = height - 200;
         
         for (String industry:  allIndList){
         pushMatrix();
         translate(indLocation,indYLoc );
          rotate(HALF_PI);
          translate(-indLocation, -indYLoc);
         text(industry, indLocation, indYLoc);
         popMatrix();
         indLocation= indLocation+wMargin;
       }
       
       float hMargin= (indYLoc-hBorder)/years.length;
       float yearLocation=hBorder;
       for (int year:  years){
         text(year , 10, yearLocation);
         yearLocation= yearLocation+hMargin;
       }
       indLocation=50;
       yearLocation=hBorder; 
         for (int i =0; i<allIndList.size();i++){
             for (int j=0; j<years.length;j++){
               String ind= allIndList.get(i);
               int year = years[j];
               Map<String , Float> indValMap = yearIndustryContributionMap.get(year);
               ArrayList<Float> al = new ArrayList<Float>(indValMap.values());
              Collections.sort(al);
            float min = al.get(0);
            float max = al.get(al.size()-1);
        
               float val = indValMap.get(ind) ==null?0 :indValMap.get(ind)  ;
                   float redC= map(val,min , max,0,255);
                   fill(255, 255-redC, 255-redC);
                   noStroke();
                    rect(indLocation, yearLocation, wMargin, hMargin);
                    yearLocation= yearLocation+hMargin;
                    fill(255);
                }
               indLocation= indLocation+wMargin;
                     yearLocation=hBorder;
         }
     }
     
     void drawYearWiseAnimate(){
      background(123);
     int year = years[yearIndx];
     yearIndx= (yearIndx+1)%(years.length-1);
       Map<String, Float> indContMap = yearIndustryContributionMap.get(year);
       indIndex=0;
      for (String industry : indContMap.keySet()){
        ArrayList<Float> al = new ArrayList<Float>(indContMap.values());
        Collections.sort(al);
        float min = al.get(0);
        float max = al.get(al.size()-1);
        float rectVal = map(indContMap.get(industry) , min, max, 100,400 );
        text(industry, 0 ,indIndex, 10);
        rect(300, indIndex, rectVal, 20);
        indIndex= indIndex+hMargin;
      }
}
}

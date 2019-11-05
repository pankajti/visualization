class TickerCompositionView extends AbstractNiftyView{
  float h =70;
  float hMargin = 20;
 void  settings(){
   size(900,1200);
  } 
  void setup(){
    background(125, 0,125);
     text("Ticker"    , 0 , 20);
       text("startDate"    , 200 , 20);
       text("Months"    , 300 , 20);
       text("end date"    , width -(300+20 ) , 20);
    for (String ticker : tickerDurationMap.keySet()){
      SortedSet<Duration> durations = tickerDurationMap.get(ticker);
      for (Duration d : durations){
        float monthsDiff  = ChronoUnit.MONTHS.between( d.startDate, d.endDate);
      
       text(ticker    , 0 , h-hMargin/2);
        text("" +d.startDate  , 300-100 , h-hMargin/2);
        fill(255-monthsDiff, 255, 255-monthsDiff);
        rect(300 , h-hMargin, monthsDiff, hMargin);
        fill(255);
        text("" + int(monthsDiff+1)  , 300+monthsDiff+20, h-hMargin/2);
        text("" + d.endDate  , width -(300+20 ), h-hMargin/2);
            h = h+hMargin;
      }
    }
   }
   
   void draw(){
    // background(123);
}
}

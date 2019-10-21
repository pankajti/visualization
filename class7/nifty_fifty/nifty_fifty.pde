import java.util.SortedSet;
import java.util.TreeSet;
import java.util.Comparator;
import java.util.Collections;
import java.text.DateFormatSymbols;
/**

This program shows composition of Stocks in Nifty 50 index each month since 2008 january. 
The graphs show Free floating Market cap of each company present in the stock in that month in descending order.Several Information we can get fro graph like what time a company exited.
what are the companies present for full history which is the top company in a particular /year month.the dataset is missing form few records 

The data I am using is provided on nifty 50 website and the is presented monthly. There are some data points missing. Initial screen might take some time to load since currently data processing is done at that time.

*/
HashMap<Integer, SortedSet<EquityRecord>> niftySymbolList = new HashMap<Integer, SortedSet<EquityRecord>>();
ArrayList<Integer> sec_keys;
int index = 0;
int sec_key =0 ;
int displayCount= 50;

 void setup(){
  size(1000, 800);
  frameRate(3);
  DataLoader dataLoader = new DataLoader();
  dataLoader.loadNiftyData();
  DataSmoother smoother = new DataSmoother();
  niftySymbolList = smoother.smoothenData(4);
  sec_keys = new ArrayList<Integer>(niftySymbolList.keySet());
  Collections.sort(sec_keys);
}

void draw(){
  background(189,125,125);
  sec_key = sec_keys.get(  index++);
  index = index>=sec_keys.size() ? 0 : index;
  // SortedSet<EquityRecord> recYear = niftySymbolList.get(sec_key); //<>//
  SortedSet<EquityRecord> recYear = niftySymbolList.get(sec_key);
   float y =20;
   int i =0;
    for (EquityRecord rec : recYear){
       if (displayCount < i++){
         break;
       }
      y=y+15;
      float o_val = rec.getFreeFloatMarketCap();
     float val= map(o_val, .22, 530500, 0,800);
     fill(255);
     int h_c = rec.getSymbol().hashCode();
     int nameSize = rec.getName().length();
     int industrySize = rec.getIndustry().length();
     int r = h_c;
     int g = h_c*h_c;
     int b = h_c*h_c*h_c;
     fill(r%255,  g%255, b%255);
     rect(125, y, val, 10);
     fill(0);
     text(rec.symbol, 20,y+10);
     String t =    new DateFormatSymbols().getMonths()[(sec_key%10000)/100-1] + "   " +sec_key/10000;
     text(t , (width/2)-20,20);
     text(val, 125+val+10,y+10);
     textSize(20); 
     fill(123,255,201);
     stroke(360);
     strokeWeight(1);
     text("Free Float Market Capitalisation (Rs. Crores)",   width - width/2, height-250);
     text("Nifty Fifty Stocks Since 2008",   width - width/2+20, height-220);
     textSize(14); 
    }
}

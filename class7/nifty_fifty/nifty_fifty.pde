import java.util.SortedSet;
import java.util.TreeSet;
import java.util.Comparator;
import java.util.Collections;

HashMap<Integer, SortedSet<EquityRecord>> niftySymbolList = new HashMap<Integer, SortedSet<EquityRecord>>();
ArrayList<Integer> keys;
int index = 0;
int key =0 ;

void setup(){
  size(1000, 800);
  frameRate(20);
  DataLoader dataLoader = new DataLoader();
  dataLoader.loadNiftyData();
  DataSmoother smoother = new DataSmoother();
  niftySymbolList = smoother.smoothenData(40);
  keys = new ArrayList<Integer>(niftySymbolList.keySet());
  Collections.sort(keys);
  //print(keys);
}

void draw(){
  background(255,125,125);
  key = keys.get(  index++);
  index = index>=keys.size() ? 0 : index;
  // SortedSet<EquityRecord> recYear = niftySymbolList.get(key); //<>//
  SortedSet<EquityRecord> recYear = niftySymbolList.get(key);
   float y =20;
    for (EquityRecord rec : recYear){
      y=y+15;
     float val= map(rec.getFreeFloatMarketCap(), .22, 530500, 0,800);
     fill(255);
     pushMatrix();
     int h_c = rec.getSymbol().hashCode();
     int nameSize = rec.getName().length();
     int industrySize = rec.getIndustry().length();
     int r = h_c;
     int g = h_c*nameSize;
     int b = h_c*industrySize;
     fill(r%255,  g%255, b%255);
     rect(125, y, val, 10);
     popMatrix();
     fill(0);
     text(rec.symbol, 20,y+10);
     String t ="year :: " + key/100 +" Month" + key%100;
     text(t , (width/2)-20,10);
      
     text(val, 125+ val+10,y+10);
     text("Free Float Market Capitalisation (Rs. Crores)",   width - width/3, height-250);
     text("Nifty Fifty Stocks Since 2008",   width - width/3+20, height-220);

    }
}

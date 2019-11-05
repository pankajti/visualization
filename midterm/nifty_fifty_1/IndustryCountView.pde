class IndustryCountView extends AbstractNiftyView{  
  void settings(){
      size(800, 800);
  }

SortedSet<String> allIndustries = new TreeSet();
  ArrayList <String> allIndList;
  
void setup (){
   int count =0;
   for (int year : years){
      allIndustries.addAll(yearIndustryContributionMap.get(year).keySet());
    }
    allIndList= new ArrayList<String>(allIndustries);
frameRate(.5);    
}


void draw(){
  drawYearWiseAnimate2();
}

  Integer [] years = {2009,2010, 2011,2012,2013, 2014, 2015, 2016,2017,2018,2019};
int yearIndx=0;
float hMargin= 20;


void drawYearWiseAnimate2(){
   background(0,123,99);

     int year = years[yearIndx];
          text("Industry Count For Nifty50 in  "+year, width/2 -150, 10);

      yearIndx= (yearIndx+1)%(years.length-1);
       Map<String, Integer> indContMap = yearIndustryCountMap.get(year);
       ArrayList<Integer> al = new ArrayList<Integer>(indContMap.values());
        Collections.sort(al);
        float min = al.get(0);
        float max = al.get(al.size()-1);
       float indIndex=50;
      for (String industry : allIndList){
        int indCount = indContMap.get(industry)==null ?0:indContMap.get(industry);
        float rectVal = map( indCount, min, max, 20,100 );
        industry = industry==null ||  industry.isEmpty() ?"Unknown" :industry;
        text(industry, 0 ,indIndex + hMargin, 10);
        fill(255 ,255-2*indCount-20,255-2*indCount-20);
        rect(300, indIndex, rectVal, 20);
        fill(255);
        indIndex= indIndex+hMargin;
      }
 }

 void drawYearWiseAnimate(){
      background(0,123,99);
     int year = years[yearIndx];
      yearIndx= (yearIndx+1)%(years.length-1);
       Map<String, Integer> indContMap = yearIndustryCountMap.get(year);
       float indIndex=0;
      for (String industry : indContMap.keySet()){
        ArrayList<Integer> al = new ArrayList<Integer>(indContMap.values());
        Collections.sort(al);
        float min = al.get(0);
        float max = al.get(al.size()-1);
        int indCount = indContMap.get(industry);
        float rectVal = map( indCount, min, max, 1,100 );
        text(industry, 0 ,indIndex + hMargin, 10);
        fill(255 ,255-2*indCount-20,255-2*indCount-20);
        rect(300, indIndex, indCount, 20);
        fill(255);
        indIndex= indIndex+hMargin;
      }
 }
}

import java.util.*;
Map<Integer, Map<String , Integer>> yearIndustryCountMap = new LinkedHashMap<Integer, Map<String , Integer>>();
Map<Integer, Map<String , Float>> yearIndustryContributionMap = new LinkedHashMap<Integer, Map<String , Float>>();


int start_year =  2009;
int end_year = 2019;
String compName ="Free Float Market Capitalisation (Rs. Crores)";
class IndustryAnalysis{
  
 Map<Integer, Map<String , Integer>> calculateIndustryCompositions(Table niftyTable ){
        niftyTable.sort("report_date");

  for (int i = start_year ; i <= end_year ; i++){
  Table t = new Table(niftyTable.matchRows("^" + i +".*", "report_date"));
       LinkedHashMap<String , Integer>  industryCountMap = new LinkedHashMap<String , Integer> ();
  for (TableRow r : t.rows()){
    String key1 = r.getString("Industry");
    if (industryCountMap.get(key1)==null){
     industryCountMap.put(key1, 1);
     }
   else {
     int val = industryCountMap.get(key1);
       val= val+1;
      industryCountMap.put(key1, val);
  } 
   }
  yearIndustryCountMap.put(i, industryCountMap);
  }
       
   return yearIndustryCountMap;
  }
  
  
  Map<Integer, Map<String , Float>> calculateIndustryContribution(Table niftyTable ){
  for (int i = start_year ; i <= end_year ; i++){
  Table t = new Table(niftyTable.matchRows("^" + i +".*", "report_date"));
       LinkedHashMap<String , Float>  industryCompMap = new LinkedHashMap<String , Float> ();
  for (TableRow r : t.rows()){
    String key1 = r.getString("Industry");
    if (industryCompMap.get(key1)==null){
      float val = r.getFloat(compName);
     industryCompMap.put(key1, val);
     }
   else {
     float val = industryCompMap.get(key1);
       val= val+r.getFloat(compName);;
      industryCompMap.put(key1, val);
  } 
   }
  yearIndustryContributionMap.put(i, industryCompMap);
  }
   return yearIndustryContributionMap;
  }  
}

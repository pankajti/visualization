class DataLoader{
  
  void loadNiftyData(){
  Table table = loadTable("nifty_fifty_companies2.csv", "header");
  //Table table = loadTable("abb.csv", "header");
 for (TableRow row : table.rows()) {
  String symbol = row.getString(0) ;
  String name = row.getString(1) ;
  String industry = row.getString(2) ;
  float equityCapital = row.getFloat(3);
  float freeFloatMarketCap = row.getFloat(4);
  float weightage = row.getFloat(5);
  float beta = row.getFloat(6);
  float r2 = row.getFloat(7);
  float volatalityPerc = row.getFloat(8);
  float monthlyReturn = row.getFloat(9);
  float avgImpact = row.getFloat(10);
  String reportDate = row.getString(11);
  String [] dateArr= reportDate.split("-");
  int year = Integer.parseInt(dateArr[0]);
  int month = Integer.parseInt(dateArr[1]);
  int key1 =  year*100+month;
  EquityRecord record = new EquityRecord(symbol,   name,   industry,   equityCapital,   freeFloatMarketCap,
        weightage,   beta,   r2,   volatalityPerc,   monthlyReturn,   avgImpact, reportDate) ;
 
 if (niftySymbolList.get(key1)==null){
   SortedSet<EquityRecord> s= new TreeSet<EquityRecord>(new Comparator<EquityRecord>() {
    @Override
    public int compare(EquityRecord o1, EquityRecord o2) {
      // TODO Auto-generated method stub
      return (int)(o2.getFreeFloatMarketCap()-o1.getFreeFloatMarketCap());
    } 
   });
   s.add(record);
   niftySymbolList.put(key1, s);
 }
 else {
      SortedSet<EquityRecord> s = niftySymbolList.get(key1);
         s.add(record);
    niftySymbolList.put(key1, s);
  } 
  }
  
}
}

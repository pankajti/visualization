class DataLoader{
  
  void loadNiftyData(){
  Table table = loadTable("nifty_fifty_companies.csv", "header");
 for (TableRow row : table.rows()) {
  String symbol = row.getString(1) ;
  String name = row.getString(2) ;
  String industry = row.getString(3) ;
  float equityCapital = row.getFloat(4);
  float freeFloatMarketCap = row.getFloat(5);
  float weightage = row.getFloat(6);
  float beta = row.getFloat(7);
  float r2 = row.getFloat(8);
  float volatalityPerc = row.getFloat(9);
  float monthlyReturn = row.getFloat(10);
  float avgImpact = row.getFloat(11);
  String reportDate = row.getString(12);
  String [] dateArr= reportDate.split("-");
  int year = Integer.parseInt(dateArr[0]);
  int month = Integer.parseInt(dateArr[1]);
  int key =  year*100+month;
  EquityRecord record = new EquityRecord(symbol,   name,   industry,   equityCapital,   freeFloatMarketCap,
        weightage,   beta,   r2,   volatalityPerc,   monthlyReturn,   avgImpact, reportDate) ;
 
 if (niftySymbolList.get(key)==null){
   SortedSet<EquityRecord> s= new TreeSet<EquityRecord>(new Comparator<EquityRecord>() {
    @Override
    public int compare(EquityRecord o1, EquityRecord o2) {
      // TODO Auto-generated method stub
      return (int)(o2.getFreeFloatMarketCap()-o1.getFreeFloatMarketCap());
    } 
   });
   s.add(record);
   niftySymbolList.put(key, s);
 }
 else {
      SortedSet<EquityRecord> s = niftySymbolList.get(key);
         s.add(record);
    niftySymbolList.put(key, s);
  } 
  }
  
}
}
